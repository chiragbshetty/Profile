create or replace procedure update_program_status as
-- Stored procedure to be called on a daily basis to mark events as Active or Inactive
cursor program_data is
select progid,to_date(progstartdt,'dd-mm-yy') progsdt,to_date(progenddt,'dd-mm-yy') progedt,progstatus from programs;

curr_date date := to_date(sysdate,'dd-mm-yy');

begin
for each in program_data loop
  if each.progsdt is not null then
    if curr_date < each.progsdt then
      update programs set progstatus = 'F' where progid = each.progid;
    elsif each.progsdt >= curr_date and each.progedt is not null and each.progedt <= curr_date then
      update programs set progstatus = 'A' where progid = each.progid;
    end if;
  elsif each.progedt is not null then
    if curr_date < each.progedt then
      update programs set progstatus = 'A' where progid = each.progid;
    else 
      update programs set progstatus = 'I' where progid = each.progid;
    end if;
  else 
    update programs set progstatus = 'A' where progid = each.progid;
  end if;
end loop;
end;

execute update_program_status;




create or replace trigger update_student_ticket_status
-- Trigger to store the ticket status when a student deactivates his profile temporarily.
after update of studstatus
on students
for each row
declare
new_stud_status students.studstatus%type;
new_tkt_status l_ticket_status.statusid%type;

cursor C1 is
select tktid, tktcurrentstatus from 
tickets t join student_ticket st
on t.tktid = st.studtktid
where stud_id = :new.studid;

begin
new_stud_status := :new.studstatus;
if (new_stud_status = 'I') then
  for each_ticket in C1 loop
    case 
      when each_ticket.tktcurrentstatus = '1' then 
        select statusid into new_tkt_status from l_ticket_status where statusvalue = 'New_Archived';
      when each_ticket.tktcurrentstatus = '2' then
        select statusid into new_tkt_status from l_ticket_status where statusvalue = 'Open_Archived';
      when each_ticket.tktcurrentstatus = '3' then
        select statusid into new_tkt_status from l_ticket_status where statusvalue = 'OnHold_Archived';
      when each_ticket.tktcurrentstatus = '4' then
        select statusid into new_tkt_status from l_ticket_status where statusvalue = 'Closed_Archived';
      else 
        continue;
    end case;
    update tickets set tktcurrentstatus = new_tkt_status where tktid = each_ticket.tktid;
  end loop;
end if;
end;


create or replace procedure sproc_bulk_tag_association (tag_var TAGS.TAGNAME%type) as
-- stored procedure to assign a single tag to multiple students together.
  cursor C1 is
  Select * from BULK_TAG_ASSOCIATION;
c_1 int;
c_2 int;
tag_id TAGS.TAGID%type;
Begin
Select count(*) into c_1 from TAGS TG Join STUDENT_TAG_TYPE STT on (TG.TAGID = STT.STUDTAGID) where TG.TAGNAME = tag_var;
  IF (c_1 = 1) then
    Select TAGID into tag_id from TAGS where TAGNAME = tag_var;    
      For Curr_pointer in C1 loop
        select Count(*) into c_2 From STUDENT_TAG WHERE STUDID = Curr_pointer.STUDID AND STUDTAGID = tag_id;
          If (c_2 = 0) then
          INSERT INTO STUDENT_TAG VALUES (tag_id,Curr_pointer.STUDID);
            DBMS_OUTPUT.PUT_LINE(tag_id ||'-'|| tag_var || ' TAG --> to student id: ' || Curr_pointer.STUDID);
          Else
            DBMS_OUTPUT.PUT_LINE(tag_id ||'-'|| tag_var || ' ALREADY EXISTS FOR '|| Curr_pointer.STUDID);
          END IF;                
      End loop;    
  ELSE
        DBMS_OUTPUT.PUT_LINE('INVALID TAG NAME');
  END IF; 
end;


create or replace procedure patient_payment (payment_amount in patient_treatments.amountpaid%type,
                                             pid in patients.patientid%type) as
-- Compose a cursor that has all the visitation and treatment records for a particular patient
-- and the costs associated with each payment and the net amount paid. The result
-- is ordered by visitation date
cursor c1 is
select pt.visitid as visitnum, treatmentid, netamount, amountpaid
from patient_treatments pt join patient_visits pv
on pt.visitid = pv.visitid
where pv.patientid = pid
order by visitdate;

trt_amt_due patient_treatments.netamount%type := 0;
rem_pay_amt patient_treatments.amountpaid%type := payment_amount;

begin  
  -- Loop through the treatment payments until the payment amount reaches 0
  while rem_pay_amt > 0 loop
    -- Iterate through each treatment from the cursor record
    for each_treatment in c1 loop
      -- Obtain the due amount for each treatment.
      trt_amt_due := each_treatment.netamount - each_treatment.amountpaid;
      -- Check if the due amount is pending or paid for
      if (trt_amt_due > 0) then
        -- If the payment amount is greater than the due amount, make the payment and 
        -- deduct the amount from the payment amount reserve and clear the due
        if(rem_pay_amt >= trt_amt_due) then
          each_treatment.amountpaid := each_treatment.amountpaid + trt_amt_due;          
        -- If the payment amount is lesser than the due amount, add the payment amount
        -- balance to the amount paid and clear the remaining payment amount
        elsif (rem_pay_amt < trt_amt_due) then
          each_treatment.amountpaid := each_treatment.amountpaid + rem_pay_amt;
        end if;    
        rem_pay_amt := rem_pay_amt - trt_amt_due;
        -- Update the treatment record of the patient accordingly and for the corresponding visit
        update patient_treatments set amountpaid = each_treatment.amountpaid 
        where visitid = each_treatment.visitnum and treatmentid = each_treatment.treatmentid;
        -- If the balance of the payment amount has reached 0 then exit
        if (rem_pay_amt <= 0) then 
          exit; 
        end if;
      end if;
    end loop;  
  end loop;
  -- Update the patients table to adjust the overall balance due
  -- Assuming that the balance due amount can go negative indicating positive credit for the patient
  update patients set pbalancedue = pbalancedue - payment_amount where patientid = pid;  
end;
/

execute patient_payment(6000, 'P102');

