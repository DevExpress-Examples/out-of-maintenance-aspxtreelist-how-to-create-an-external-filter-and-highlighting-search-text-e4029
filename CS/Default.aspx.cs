using DevExpress.Web.ASPxTreeList;
using System;

public partial class _Default : System.Web.UI.Page
{
    protected void ASPxTreeList1_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
    {
        if (e.Column.FieldName.Equals("LastName"))
        {
            String filterText = SearchText.Text;
            String value = e.CellValue.ToString();
            int startPos = GetStartPos(filterText, value);
            if (startPos < 0) return;

            e.Cell.Text = GetHighlightedText(startPos, filterText, value);
        }
    }

    private String GetHighlightedText(int startPos, String searchText, String value)
    {
        String beginTag = "<span style=\"background-color:#99FF66\">";
        String endTag = "</span>";

        value = value.Insert(startPos, beginTag);
        return value.Insert(startPos + beginTag.Length + searchText.Length, endTag);
    }

    private int GetStartPos(String searchText, String value)
    {
        if (searchText == String.Empty) return -1;
        String textLower = searchText.ToLower();
        String valueLover = value.ToLower();
        return valueLover.IndexOf(textLower);
    }

    protected void FilterButton_Click(object sender, EventArgs e)
    {
        TreeListNodeIterator iterator = new TreeListNodeIterator(EmployeeTreeList.RootNode);
        EmployeeTreeList.CollapseAll();
        while (iterator.Current != null)
        {
            CheckNode(iterator.Current);
            iterator.GetNext();
        }
    }

    private void CheckNode(TreeListNode node)
    {
        string filterText = SearchText.Text.ToLower();
        object nodeValue = node.GetValue("LastName");
        if (nodeValue == null)
            return;
        if (nodeValue.ToString().ToLower().IndexOf(filterText) >= 0)
            node.MakeVisible();
    }
}