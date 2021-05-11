Imports System.Data
Public Class clsLogin

    Public Function LoginUser(ByVal user As String, ByVal pass As String) As DataSet
        Dim ds
        Try

            Dim lista As New Dictionary(Of String, String)
            lista.Add("User", user)
            lista.Add("Pass", pass)

            Dim objDB As New clsDB()
            ds = objDB.ExecuteSP("[SP_RE_Login]", lista)
        Catch ex As Exception
            clsLOG.generateError("clsLogin - LoginUser - Exception: " + ex.Message)
        End Try

        Return ds
    End Function

    Public Shared Function IsClient(ByVal user As clsUser) As Boolean
        Dim response As Boolean = (Integer.Parse(user.profile.ToString) > 1)
        Return response
    End Function

    Public Shared Function IsValidEmail(ByVal email As String) As Boolean
        Dim response As Boolean = False
        Try

            Dim objDB As New clsDB()
            Dim dic As New Dictionary(Of String, String)
            dic.Add("Email", email)
            Dim ds = objDB.ExecuteSP("[SP_MDA_ValidarEmail]", dic)

            If ds.Tables(0).Rows(0).ItemArray(0) = "OK" Then
                response = True
            End If

        Catch ex As Exception
            clsLOG.generateError("clsLogin - IsValidEmail - Exception: " + ex.Message)
        End Try

        Return response
    End Function




    Const cryptkey = "GNQ?4i0-*\CldnU+[vrF1j1PcWeJfVv4QGBurFK6}"



    Function ConnPut(ByVal strCryptThis As String) As String

        ConnPut = Base64Encode(encrypt1(strCryptThis))
    End Function

    Function ConnGet(ByVal strEncrypted As String)
        strEncrypted = Base64Decode(strEncrypted)

        ConnGet = decrypt1(strEncrypted)
    End Function


    Function encrypt1(ByVal inputstr As String) As String
        Dim i, x, cc As Integer
        Dim outputstr As String = ""
        cc = 0
        For i = 1 To len(inputstr)
            x = asc(mid(inputstr, i, 1))
            x = x - 48
            If x < 0 Then x = x + 255
            x = x + asc(mid(cryptkey, cc + 1, 1))
            If x > 255 Then x = x - 255
            outputstr = outputstr & Strings.chr(x)
            cc = (cc + 1) Mod len(cryptkey)
        Next
        encrypt1 = outputstr
    End Function

    '**************************** DECRYPT FUNCTION ******************************

    Function decrypt1(ByVal inputstr As String) As String
        Dim i, x, cc As Integer
        inputstr = inputstr
        Dim outputstr As String = ""
        cc = 0
        For i = 1 To len(inputstr)
            x = asc(mid(inputstr, i, 1))
            x = x - asc(mid(cryptkey, cc + 1, 1))
            If x < 0 Then x = x + 255
            x = x + 48
            If x > 255 Then x = x - 255
            outputstr = outputstr & Strings.chr(x)
            cc = (cc + 1) Mod len(cryptkey)
        Next
        decrypt1 = outputstr
    End Function









    Function Base64Encode(inData) As String


        Const Base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        Dim cOut, sOut, I As Integer

        'For each group of 3 bytes

        For I = 1 To Len(inData) Step 3
            Dim nGroup, pOut, sGroup

            'Create one long from this 3 bytes.

            nGroup = &H10000 * Asc(Mid(inData, I, 1)) + _
            &H100 * MyASC(Mid(inData, I + 1, 1)) + MyASC(Mid(inData, I + 2, 1))

            'Oct splits the long To 8 groups with 3 bits

            nGroup = Oct(nGroup)

            'Add leading zeros

            nGroup = StringA(8 - Len(nGroup), "0") & nGroup

            'Convert To base64

            pOut = Mid(Base64, CLng("&o" & Mid(nGroup, 1, 2)) + 1, 1) + _
            Mid(Base64, CLng("&o" & Mid(nGroup, 3, 2)) + 1, 1) + _
            Mid(Base64, CLng("&o" & Mid(nGroup, 5, 2)) + 1, 1) + _
            Mid(Base64, CLng("&o" & Mid(nGroup, 7, 2)) + 1, 1)

            'Add the part To OutPut string

            sOut = sOut + pOut

            'Add a new line For Each 76 chars In dest (76*3/4 = 57)
            'If (I + 2) Mod 57 = 0 Then sOut = sOut + vbCrLf

        Next
        Select Case Len(inData) Mod 3
            Case 1 '8 bit final

                sOut = Left(sOut, Len(sOut) - 2) + "=="
            Case 2 '16 bit final

                sOut = Left(sOut, Len(sOut) - 1) + "="
        End Select
        Base64Encode = sOut
    End Function

    Function MyASC(ByVal OneChar As String) As String
        If OneChar = "" Then MyASC = 0 Else MyASC = Asc(OneChar)
    End Function



    Function Base64Decode(ByVal base64String As String) As String


        Const Base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        Dim dataLength, groupBegin As Integer
        Dim sOut As String


        'remove white spaces, If any

        base64String = Replace(base64String, vbCrLf, "")
        base64String = Replace(base64String, vbTab, "")
        base64String = Replace(base64String, " ", "")

        'The source must consists from groups with Len of 4 chars

        dataLength = Len(base64String)
        If dataLength Mod 4 <> 0 Then
            Err.Raise(1, "Base64Decode", "Bad Base64 string.")
            Exit Function
        End If


        ' Now decode each group:

        For groupBegin = 1 To dataLength Step 4
            Dim numDataBytes, CharCounter, thisChar, thisData, nGroup, pOut
            ' Each data group encodes up To 3 actual bytes.

            numDataBytes = 3
            nGroup = 0

            For CharCounter = 0 To 3
                ' Convert each character into 6 bits of data, And add it To
                ' an integer For temporary storage. If a character is a '=', there
                ' is one fewer data byte. (There can only be a maximum of 2 '=' In
                ' the whole string.)

                thisChar = Mid(base64String, groupBegin + CharCounter, 1)

                If thisChar = "=" Then
                    numDataBytes = numDataBytes - 1
                    thisData = 0
                Else
                    thisData = InStr(1, Base64, thisChar, vbBinaryCompare) - 1
                End If
                If thisData = -1 Then
                    Err.Raise(2, "Base64Decode", "Bad character In Base64 string.")
                    Exit Function
                End If

                nGroup = 64 * nGroup + thisData
            Next

            'Hex splits the long To 6 groups with 4 bits

            nGroup = Hex(nGroup)

            'Add leading zeros

            nGroup = StringA(6 - Len(nGroup), "0") & nGroup

            'Convert the 3 byte hex integer (6 chars) To 3 characters

            pOut = Chr(CByte("&H" & Mid(nGroup, 1, 2))) + _
            Chr(CByte("&H" & Mid(nGroup, 3, 2))) + _
            Chr(CByte("&H" & Mid(nGroup, 5, 2)))

            'add numDataBytes characters To out string

            sOut = sOut & Left(pOut, numDataBytes)
        Next

        Base64Decode = sOut
    End Function

    Function StringA(ByVal st As String, ByVal cant As Integer) As String
        Dim stResult As String = ""
        Dim i As Integer
        For i = 1 To cant
            stResult = stResult & st
        Next
    End Function




End Class
