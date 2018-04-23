Imports DevExpress.Web.ASPxTreeList
Imports System

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub ASPxTreeList1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As TreeListHtmlDataCellEventArgs)
        If e.Column.FieldName.Equals("LastName") Then
            Dim filterText As String = SearchText.Text
            Dim value As String = e.CellValue.ToString()
            Dim startPos As Integer = GetStartPos(filterText, value)
            If startPos < 0 Then
                Return
            End If

            e.Cell.Text = GetHighlightedText(startPos, filterText, value)
        End If
    End Sub

    Private Function GetHighlightedText(ByVal startPos As Integer, ByVal searchText As String, ByVal value As String) As String
        Dim beginTag As String = "<span style=""background-color:#99FF66"">"
        Dim endTag As String = "</span>"

        value = value.Insert(startPos, beginTag)
        Return value.Insert(startPos + beginTag.Length + searchText.Length, endTag)
    End Function

    Private Function GetStartPos(ByVal searchText As String, ByVal value As String) As Integer
        If searchText = String.Empty Then
            Return -1
        End If
        Dim textLower As String = searchText.ToLower()
        Dim valueLover As String = value.ToLower()
        Return valueLover.IndexOf(textLower)
    End Function

    Protected Sub FilterButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim iterator As New TreeListNodeIterator(EmployeeTreeList.RootNode)
        EmployeeTreeList.CollapseAll()
        Do While iterator.Current IsNot Nothing
            CheckNode(iterator.Current)
            iterator.GetNext()
        Loop
    End Sub

    Private Sub CheckNode(ByVal node As TreeListNode)
        Dim filterText As String = SearchText.Text.ToLower()
        Dim nodeValue As Object = node.GetValue("LastName")
        If nodeValue Is Nothing Then
            Return
        End If
        If nodeValue.ToString().ToLower().IndexOf(filterText) >= 0 Then
            node.MakeVisible()
        End If
    End Sub
End Class