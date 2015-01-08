import os
import re
import utlFmsa

# Intermediate variables to make the dbList dictionary use less columns
vspeedDbDir  = utlFmsa.ROUTE_DIR + r'FMSA-Ver\db-vspeed'

# dbList is a python "dictionary" that holds the paths to VspeedDbs for
# both ICPF host and target
dbList = {'blankDb'      : {'host': ' ',                                    'target': ' '},
          'M145_Trial_DB': {'host': vspeedDbDir + r'\M145_Trial_DB\host\\', 'target': '/mnt/v-speeds/M145_Trial_DB/'},
          'VerTestDB_14' : {'host': vspeedDbDir + r'\VerTestDB_14\host\\',  'target': ' '},
          'VerTestDB_2' : {'host': vspeedDbDir + r'\VerTestDB_2\host\\',  'target': ' '},
          'VerTestDB_15' : {'host': vspeedDbDir + r'\VerTestDB_15\host\\',  'target': '/mnt/v-speeds/VerTestDB_15/'},
          'VerTestDB_16' : {'host': vspeedDbDir + r'\VerTestDB_16\host\\',  'target': ' '},
          'VerTestDB_17' : {'host': vspeedDbDir + r'\VerTestDB_17\host\\',  'target': ' '},
          'VerTestDB_18' : {'host': vspeedDbDir + r'\VerTestDB_18\host\\',  'target': ' '},
          'VerTestDB_19' : {'host': vspeedDbDir + r'\VerTestDB_19\host\\',  'target': ' '},
          'VerTestDB_20' : {'host': vspeedDbDir + r'\VerTestDB_20\host\\',  'target': ' '},
          'VerTestDB_21' : {'host': vspeedDbDir + r'\VerTestDB_21\host\\',  'target': '/mnt/misc_1/VerTestDB_21/'},
          'VerTestDB_25' : {'host': vspeedDbDir + r'\VerTestDB_25\host\\',  'target': '/mnt/misc_1/VerTestDB_25/'},
          'VerTestDB_26' : {'host': vspeedDbDir + r'\VerTestDB_26\host\\',  'target': '/mnt/misc_2/VerTestDB_26/'},
          'VerTestDB_27' : {'host': vspeedDbDir + r'\VerTestDB_27\host\\',  'target': '/mnt/misc_2/VerTestDB_27/'},
          'VerTestDB_30' : {'host': vspeedDbDir + r'\VerTestDB_30\host\\',  'target': '/mnt/misc_3/VerTestDB_30/'},
          'VerTestDB_32' : {'host': vspeedDbDir + r'\VerTestDB_32\host\\',  'target': '/mnt/misc_3/VerTestDB_32/'},
          'VerTestDB_33' : {'host': vspeedDbDir + r'\VerTestDB_33\host\\',  'target': ' '},
          'VerTestDB_34' : {'host': vspeedDbDir + r'\VerTestDB_34\host\\',  'target': ' '},
          'VerTestDB_39' : {'host': vspeedDbDir + r'\VerTestDB_39\host\\',  'target': ' '},
          'VerTestDB_41' : {'host': vspeedDbDir + r'\VerTestDB_41\host\\',  'target': ' '},
          'VerTestDB_42' : {'host': vspeedDbDir + r'\VerTestDB_42\host\\',  'target': ' '},
          'VerTestDB_43' : {'host': vspeedDbDir + r'\VerTestDB_43\host\\',  'target': ' '},
          'VerTestDB_44' : {'host': vspeedDbDir + r'\VerTestDB_44\host\\',  'target': ' '},
          'VerTestDB_45' : {'host': vspeedDbDir + r'\VerTestDB_45\host\\',  'target': ' '},
          'VerTestDB_46' : {'host': vspeedDbDir + r'\VerTestDB_46\host\\',  'target': ' '},
          'VerTestDB_47' : {'host': vspeedDbDir + r'\VerTestDB_47\host\\',  'target': ' '},
          'VerTestDB_48' : {'host': vspeedDbDir + r'\VerTestDB_48\host\\',  'target': ' '},
          'VerTestDB_49' : {'host': vspeedDbDir + r'\VerTestDB_49\host\\',  'target': ' '},
          'VerTestDB_50' : {'host': vspeedDbDir + r'\VerTestDB_50\host\\',  'target': ' '},
          'VerTestDB_51' : {'host': vspeedDbDir + r'\VerTestDB_51\host\\',  'target': ' '},
          'VerTestDB_52' : {'host': vspeedDbDir + r'\VerTestDB_52\host\\',  'target': ' '},
          'VerTestDB_53' : {'host': vspeedDbDir + r'\VerTestDB_53\host\\',  'target': ' '},
          'VerTestDB_54' : {'host': vspeedDbDir + r'\VerTestDB_54\host\\',  'target': ' '},
          'VerTestDB_55' : {'host': vspeedDbDir + r'\VerTestDB_55\host\\',  'target': ' '}
         }


def lookup(Data, inputs,database='M145_Trial_Db',dual=0):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    This function returns the value from the Vspeeds Lookup table.
    ............................................................................
    INPUTS:
    - The Lookup Table Name (The Output expected): This name should match the
    name of the lookup table present in the Database passed as a string.
    - The Various Inputs required by all the Uncorrected and Correction Tables
    with values within the valid range mentioned in the database passed in as a
    list of strings.
    Eg: ('V1',['PALT = 5000','OAT = 20',.....], 'M145_Trial_Db', 0)
          ^       ^                                   ^          ^
          Data    Inputs                        Database name  Dual Mode
    ............................................................................
    OUTPUTS:
    Eg: 87.59
    ............................................................................
    NOTE: This function cannot be used to perform computations for tables which
          contain both valid and invalid values since it will result in an
          incorrect value being returned during computations. Also all the 
          inputs provided must be within the range indicated in the tables. The
          lookup function will not proceed with the computations if the inputs 
          are not within the desired range for any particular table.
    ............................................................................
    """

    # Extract the list of input parameters required by the lookup table(s)     
    iDict, parameters =  extractContents(Data, database, dual)

    for each in inputs:
        iDict[each.split('=')[0].strip()] = each.split('=')[1].strip()
    count = 0
    for each in parameters:

      temp = each.split(',')
      print temp 
      for i in range(1, len(temp)) :
        temp[i] = iDict[temp[i].strip()]
      print temp

      prevResult = str(readVspeedDB(temp[0],temp[1:len(temp)], database, dual))
      if count == 0:
        iDict['PREV_UNC'] = prevResult

      else:
        iDict['PREV_CT'+str(count)] = prevResult

      count = count + 1

    return float(prevResult)

def extractContents(output, database='M145_Trial_Db',dual=0):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    This function is to extract the list of the Inputs and details of Correction
    tables required by the lookup tables of the desired value.This function is
    called by the lookup() function. This can also be used to simply obtain the
    list of parameters to be passed to the lookup() function.
    ............................................................................
    NOTE:
    ............................................................................
    """
    if dual == 1:
        file = dbList [database]['host'].split("host")[0]+'\\Specification\\CONTENT.VSP'
    elif dual == 0:
        file = os.environ['CS_VSPEED_DB'].split("host")[0]+'\\Specification\\CONTENT.VSP'
    fileContents = open(file,'r')
    lines = fileContents.readlines()

    for i in range(0,len(lines)):
       if(lines[i].find(output + '.UNC')>=0):
            parameters = lines[i]
       if(lines[i].find(output + '.CT')>=0):
            parameters = parameters + lines[i]

    parameters = parameters.split('\n')
    parameters = parameters[0:len(parameters)-1]
    iDict = {}
    for each in parameters:
        x=each.split(',')
        x=x[1:len(x)]
        for every in x :
            iDict[every.strip()]=" "

    return iDict, parameters

def isNum(input) :
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to identify whether the input string is a digit or not
    ............................................................................
    NOTE:
    ............................................................................
    """
    num=False
    for i in input :
        if i.isdigit() or i in['.'] :
            num=True
    return num

def readVspeedDB(fileName, dimValues, database='M145_Trial_Db',dual=0):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to read Vspeed tables from the database based on DIM parameters
    ............................................................................
    NOTE:
    ............................................................................
    """

    #Obtain the path of the Vspeed file and open it
    if dual == 1:
        vspeedPath = dbList [database]['host'].split("host")[0]+'Source\\'
    elif dual == 0:
        vspeedPath = os.environ['CS_VSPEED_DB'].split("host")[0]+'Source\\'
    if(os.path.exists(vspeedPath+fileName)):
        filein = open(vspeedPath+fileName, 'r')
    else:
        print "### File Not Found"
        return None

    # Read all the contents of the file
    lines = filein.readlines()
    index =0

    # Initialize flags to zero
    flag1=0
    flag2=0
    someFlag=0

    # Determine number of parameters passed and perform iterations accordingly
    if(len(dimValues)==1):
        for i in range(0,len(lines)):
            if(lines[i].find("#DIM1")>=0):
                lineNum=i-1
                break

        someFlag=1

        if(isNum(dimValues[0].strip())):
            dimN1Value = float(dimValues[0])
        else:
            dimN1Value = dimValues[0].strip()
            flag1=1

    elif(len(dimValues)>2):
        for i in range(0,len(dimValues)-2):
            lineNum = searchDim(lines,dimValues[i],i+1,index)
            if(lineNum!=-1):
                index = lineNum+1
            else:
                return thirdDim(i,dimValues,index, lines)

        if(isNum(dimValues[i+1].strip())):
            dimN1Value = float(dimValues[i+1])
        else:
            dimN1Value = dimValues[i+1]
            flag1=1

        if(isNum(dimValues[i+2].strip())):
            dimN2Value = float(dimValues[i+2])
        else:
            dimN2Value = dimValues[i+2]
            flag2=1

    elif(len(dimValues)==2):
        for i in range(0,len(lines)):
            if(lines[i].find("#DIM1")>=0):
                lineNum=i-1
                break

        if(isNum(dimValues[0].strip())):
            dimN1Value = float(dimValues[0])
        else:

            dimN1Value = dimValues[0].strip()
            flag1=1

        if(isNum(dimValues[1].strip())):
            dimN2Value = float(dimValues[1])
        else:
            dimN2Value = dimValues[1].strip()
            flag2=1

    else:
        print "### Insufficient Number of Dimensions"
        return None
        
    # Retrieve the line number and navigate to the required Vspeed table
    lineNum+=1
    line = lines[lineNum]
    num_elem = len(line.split(",")[2:])

    # Determine the row index for the table

    for i in range(1,num_elem+1):
        indexDimN1 = 0

        if(flag1==1):
            if(dimN1Value==line.split(",")[1+i].strip()):
                indexDimN1 = i
                break
        else:
            lowerInputDimN1 = float(line.split(",")[1+i])
            upperInputDimN1 = float(line.split(",")[2+i])
            if ((dimN1Value < upperInputDimN1) and (dimN1Value > lowerInputDimN1) ):
                indexDimN1 = i
                break
            elif (dimN1Value == lowerInputDimN1):
                indexDimN1 = i
                flag1=1
                break
            elif (dimN1Value == upperInputDimN1):
                indexDimN1 = i+1
                flag1=1
                break


    #Increment the line number by 1 to check for 2 dimension of the table

    if(someFlag==0):
        lineNum+=1
        line = lines[lineNum]
        num_elem = len(line.split(",")[2:])

        #Determine the column index of the table
        for i in range(1,num_elem+1):
            indexDimN2 = 0

            if(flag2==1):
                if(dimN2Value==line.split(",")[1+i].strip()):
                    indexDimN2 = i
                    break
            else:
                lowerInputDimN2 = float(line.split(",")[1+i])
                upperInputDimN2 = float(line.split(",")[2+i])
                if ((dimN2Value < upperInputDimN2) and (dimN2Value > lowerInputDimN2) ):
                    indexDimN2 = i
                    break
                elif (dimN2Value == lowerInputDimN2):
                    indexDimN2 = i
                    flag2=1
                    break
                elif (dimN2Value == upperInputDimN2):
                    indexDimN2 = i+1
                    flag2=1
                    break

    else:
        if(flag1==1):
            flag2=1
        else:
            flag1=1
        indexDimN2=indexDimN1
        indexDimN1 = 1
        dimN2Value = dimN1Value
        lowerInputDimN2 = lowerInputDimN1
        upperInputDimN2 = upperInputDimN1

    if(indexDimN1 == 0 or indexDimN2 == 0):
        print "### Computed Table Index is not within Range"
        filein.close()
        return None

    #Navigate to the row offset of the table
    line= lines[lineNum+indexDimN1]

    #Call for the interpolation function depending on flag interpretation
    if(flag1 == 1 and flag2==1):
        result = float(' '.join(line.split()).split(' ')[indexDimN2-1])

    elif(flag1==1 and flag2==0):
        result = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)

    elif(flag1==0 and flag2==1):
        x1 = float(' '.join(line.split()).split(' ')[indexDimN2-1])
        line = lines[lineNum+indexDimN1+1]
        x2 = float(' '.join(line.split()).split(' ')[indexDimN2-1])
        result = interpolate(1, dimN1Value, lowerInputDimN1, upperInputDimN1, x1, x2)

    else:
        x1 = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)
        line = lines[lineNum+indexDimN1+1]
        x2 = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)
        result = interpolate(1, dimN1Value, lowerInputDimN1, upperInputDimN1, x1, x2)

    #Close the file
    filein.close()

    return result

def searchDim(lines,dimValue,num,index):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to search and return the index of a DIM parameter
    ............................................................................
    NOTE:
    ............................................................................
    """

    while True:

        try:
            if(len(lines[index])==0):
                break
        except: return -1
        if(lines[index].replace(' ','').find("#DIM"+str(num)+"=")>=0):
            if(isNum(dimValue.strip())):
                if(float(lines[index].replace(' ','').split('=')[1])==float(dimValue)):
                    return index
            elif(lines[index].replace(' ','').find(str(dimValue))>0):
                return index
        index=index+1
    return -1

def interpolate(p1,p2,p3,p4,p5,p6):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to perform interpolation between 4 values
    ............................................................................
    NOTE:
    ............................................................................
    """
    flag = p1
    if(flag==0):
        line = " ".join(p2.split())

        index = float(p3)
        dimValue=float(p4)
        lowerInput = float(p5)
        upperInput = float(p6)
        tableUpper = 0.0
        tableLower = 0.0

    elif (flag==1):
        dimValue = float(p2)
        lowerInput = float(p3)
        upperInput = float(p4)
        tableLower = float(p5)
        tableUpper = float(p6)

    else:
        return -1

    temp = ""
    output = 0.0
    result = 0.0
    fieldCount = 1

    if(flag ==0):
        outputIndex = 0
        fieldCount = len(line.split(" "))

        for i in range(0,fieldCount+1):
            line_temp = line
            line_index = i
            temp = line.split(" ")[i]
            if(temp!=""):
                outputIndex = outputIndex + 1
                if (outputIndex == index ):
                    tableLower = float(temp)
                if (outputIndex == index+1 ):
                    tableUpper = float(temp)
                    break

    if(flag ==1 or flag ==0):
        if (upperInput == lowerInput):
            result = tableLower
        elif(tableLower != -1 and tableUpper != -1):
            result = (tableLower + (tableUpper - tableLower) * (dimValue - lowerInput) / (upperInput - lowerInput))

        if(tableLower == -1):
            if (dimValue < upperInput):
                result = -1
            else:
                result = tableUpper

        if(tableUpper == -1):
            if (dimValue > lowerInput):
                result = -1
            else:
                result = tableLower

    return result

def thirdDim(i,dimValues,index,lines):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to find the index of a parameter when there is a continuous value
    which doesn't have an exact match in a given Vspeed table
    ............................................................................
    NOTE:
    ............................................................................
    """
    for j in range(0,len(lines)):
        if(lines[j].find('#DIM'+str(i+1)+',')>=0):
            thisLine = lines[j]
            thisLine = thisLine[1:(len(thisLine)-1)].split(',')[2:]

    minValue = thisLine[0]
    maxValue = thisLine[1]
    
    dimValue = float(dimValues[i])

    for j in range(0,len(thisLine)):
        if(dimValue>float(thisLine[j]) and dimValue<float(thisLine[j+1])):
            minValue = thisLine[j]
            maxValue = thisLine[j+1]

    lineNum = searchDim(lines,minValue,(i+1),index)
    index = lineNum + 1

    lowerValue = thirdDimInterpolation(dimValues, (i), lines, lineNum)

    lineNum = searchDim(lines,maxValue,(i+1),index)

    upperValue = thirdDimInterpolation(dimValues, (i), lines, lineNum)

    return (interpolate(1, dimValue, minValue, maxValue, lowerValue, upperValue))

def thirdDimInterpolation(dimValues, i, lines, lineNum):
    """
    ............................................................................
    DESCRIPTION:
    -----------
    Function to perform the interpolation when there is a continuous value
    which doesn't have an exact match in a given Vspeed table
    ............................................................................
    NOTE:
    ............................................................................
    """
    #Initialize flags to zero
    flag1=0
    flag2=0
    someFlag=0

    if(isNum(dimValues[i+1].strip())):
        dimN1Value = float(dimValues[i+1])
    else:
        dimN1Value = dimValues[i+1]
        flag1=1

    if(isNum(dimValues[i+2].strip())):
        dimN2Value = float(dimValues[i+2])
    else:
        dimN2Value = dimValues[i+2]
        flag2=1

    lineNum+=1
    line = lines[lineNum]
    num_elem = len(line.split(",")[2:])


    #Determine the row index for the table

    for i in range(1,num_elem+1):
        indexDimN1 = 0

        if(flag1==1):
            if(dimN1Value==line.split(",")[1+i].strip()):
                indexDimN1 = i
                break
        else:
            lowerInputDimN1 = float(line.split(",")[1+i])
            upperInputDimN1 = float(line.split(",")[2+i])
            if ((dimN1Value < upperInputDimN1) and (dimN1Value > lowerInputDimN1) ):
                indexDimN1 = i
                break
            elif (dimN1Value == lowerInputDimN1):
                indexDimN1 = i
                flag1=1
                break
            elif (dimN1Value == upperInputDimN1):
                indexDimN1 = i+1
                flag1=1
                break


    #Increment the line number by 1 to check for 2 dimension of the table

    if(someFlag==0):
        lineNum+=1
        line = lines[lineNum]
        num_elem = len(line.split(",")[2:])

        #Determine the column index of the table
        for i in range(1,num_elem+1):
            indexDimN2 = 0

            if(flag2==1):
                if(dimN2Value==line.split(",")[1+i].strip()):
                    indexDimN2 = i
                    break
            else:
                lowerInputDimN2 = float(line.split(",")[1+i])
                upperInputDimN2 = float(line.split(",")[2+i])
                if ((dimN2Value < upperInputDimN2) and (dimN2Value > lowerInputDimN2) ):
                    indexDimN2 = i
                    break
                elif (dimN2Value == lowerInputDimN2):
                    indexDimN2 = i
                    flag2=1
                    break
                elif (dimN2Value == upperInputDimN2):
                    indexDimN2 = i+1
                    flag2=1
                    break

    else:
        if(flag1==1):
            flag2=1
        else:
            flag1=1
        indexDimN2=indexDimN1
        indexDimN1 = 1
        dimN2Value = dimN1Value
        lowerInputDimN2 = lowerInputDimN1
        upperInputDimN2 = upperInputDimN1

    if(indexDimN1==0 or indexDimN2 == 0):
        print "### Computed Table Index is not within Range"
        return None

    #Navigate to the row offset of the table
    line= lines[lineNum+indexDimN1]

    #Call for the interpolation function depending on flag interpretation
    if(flag1 == 1 and flag2==1):
        result = float(' '.join(line.split()).split(' ')[indexDimN2-1])

    elif(flag1==1 and flag2==0):
        result = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)

    elif(flag1==0 and flag2==1):
        x1 = float(' '.join(line.split()).split(' ')[indexDimN2-1])
        line = lines[lineNum+indexDimN1+1]
        x2 = float(' '.join(line.split()).split(' ')[indexDimN2-1])
        result = interpolate(1, dimN1Value, lowerInputDimN1, upperInputDimN1, x1, x2)

    else:
        x1 = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)
        line = lines[lineNum+indexDimN1+1]
        x2 = interpolate(0, line, indexDimN2, dimN2Value, lowerInputDimN2, upperInputDimN2)
        result = interpolate(1, dimN1Value, lowerInputDimN1, upperInputDimN1, x1, x2)

    return result
