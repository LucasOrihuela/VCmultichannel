Public Class clsModule
    Private menuParams As New Dictionary(Of String, String)
    Private moduleParams As New Dictionary(Of String, String)
    Public currentPage As Page
    Public Sub loadModuleParams(profile As Integer)
        moduleParams.Add("OP", "getModule")
        moduleParams.Add("Profile", profile)
    End Sub
    Public Sub loadModule()
        Dim rp = CType(currentPage.Master.FindControl("rpModules"), Repeater)
        Dim objDB As New clsDB
        Dim ds = objDB.ExecuteSP("[SP_WBO_Menu_Obtener]", moduleParams)
        CType(currentPage.Master.FindControl("hfModule"), HiddenField).Value = ds.Tables(0).Rows(0).Item("Module")
        rp.DataSource = ds
        rp.DataBind()
    End Sub
    Public Sub loadMenuParams(profile As Integer, moduleId As Integer, Optional ByVal menu As String = Nothing)
        menuParams.Add("OP", "getMenu")
        menuParams.Add("Profile", profile)
        menuParams.Add("Module", moduleId)
        If Not menu Is Nothing Then
            menuParams.Add("Menu", menu)
        End If
    End Sub
    Public Sub loadMenu()
        Dim rp = CType(currentPage.Master.FindControl("rpMenu"), Repeater)
        Dim objDB As New clsDB
        rp.DataSource = objDB.ExecuteSP("[SP_WBO_Menu_Obtener]", menuParams)
        rp.DataBind()
    End Sub
End Class
