<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagement.Admin.AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showErrorModal(errorMessage) {
            document.getElementById("errorMessage").innerText = errorMessage;
            $('#errorModal').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Image/bg3.jpg'); width: 100%; height: 937%; background-repeat: no-repeat; background-attachment: fixed;">

        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center" style="font-family: 微軟正黑體!important; font-weight: bold;">New Class</h3>

            <div class="row  mb-3 mr-lg-5 ml-lg-5  mt-md-5">
                <div class="col-md-6">
                    <h4 style="font-family: 微軟正黑體!important; font-weight: bold;">
                        <label for="txtClass">課程名稱</label>
                    </h4>
                    <asp:TextBox ID="TBClass" runat="server" CssClass="form-control" placeholder="輸入課程名稱" required></asp:TextBox>
                </div>
            </div>

            <div class="row  mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3  col-md-offset-2 mb-3">
                    <asp:Button ID="BNAdd" runat="server" CssClass="btn btn-primary  btn-block" BackColor="#3399ff" Text="新增課程" data-bs-toggle="modal" data-bs-target="#errorModalLabel" OnClick="BNAdd_Click" />
                </div>
            </div>

            <div class="row  mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table  table-dark  table-striped" AutoGenerateColumns="true" OnPageIndexChanging="GridView1_PageIndexChanging">
                    </asp:GridView>
                </div>
            </div>

            <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="errorModalLabel">錯誤提示</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="errorMessage"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
