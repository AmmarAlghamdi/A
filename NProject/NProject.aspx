<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NProject.aspx.cs" Inherits="NProject.NProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Center</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <script>
        function submit() {
            var projectName = document.getElementById("TextBox1").value;
            var budget = document.getElementById("TextBox2").value;
            var timeframe = document.getElementById("TextBox3").value;
            var area = document.getElementById("TextBox4").value;

            if (projectName === "" || budget === "" || timeframe === "" || area === "") {
                alert("Please fill in all fields.");
                return false;
            }

            return true;
        }
    </script>
</head>

 <body>
<header>
        <h1>Welcome to Project Center</h1>
        <nav>
            <ul>
                <li><a href="P">Home</a></li>
                <li><a href="#">Submit Project</a></li>
                <li><a href="#">Browse Offers</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>How It Works</h2>
        <ol class="layered-list">
            <li class="layer">
                Submit your project details including the scope of work, budget, and desired completion time.
            </li>
            <li class="layer">
                Browse offers from skilled professionals who can fulfill your project requirements.
            </li>
            <li class="layer">
                Choose the offer that best suits your needs and budget.
            </li>
            <li class="layer">
                Get your project completed within your specified timeframe and budget.
            </li>
        </ol>
    </div>

  


    <main>
        <form id="form1" runat="server" >
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
             <br />
            <asp:Label ID="Label9" runat="server" Text="Search"></asp:Label>
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
            
            <h2>Submit Your Project</h2>
            <label for="projectName">Project Name:</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />

            <label for="budget">Budget:</label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <br />

            <label for="timeframe">Timeframe:</label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />

            <label for="area">Area:</label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />


           <asp:Button ID="SAVE" runat="server" Text="SAVE" OnClick="Button1_Click"  />


            <h2>Update Your Project</h2>
             <label for="ID">ProjectID:</label>
             <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
             <br />
             <label for="projectName">Project Name:</label>
             <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
             <br />
            <label for="budget">Budget:</label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
             <br />
             <label for="timeframe">Timeframe:</label>
             <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
             <br />
             <label for="area">Area:</label>
             <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
             <br />
             <asp:Button ID="UPDATE" runat="server" Text="UPDATE" OnClick="UpdateButton_Click" />

             <h2>Delete Your Project</h2>
              <label for="ID">ProjectID:</label>
              <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
              <br />
              <asp:Button ID="DELETE" runat="server" Text="DELETE" OnClick="DeleteButton_Click" /> 
               <br />

            <h2>Upload Project File</h2>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UploadButton" runat="server" Text="Upload File" OnClick="UploadButton_Click" />
            <br />

            <h2>Session</h2>
            <div>
                <asp:Label ID="SessionLabel" runat="server" Text="Set Session    "></asp:Label>
                <asp:Button ID="SessionButton" runat="server" Text="Set Session" OnClick="SessionButton_Click" />
            </div>
            <br />

            <h2>Cookie</h2>

            <div>
                <asp:Label ID="CookieLabel" runat="server" Text="Set Cookie"></asp:Label>
                <asp:Button ID="CookieButton" runat="server" Text="Set Cookie" OnClick="CookieButton_Click" />
            </div>
            <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectCenterConnectionString %>" DeleteCommand="DELETE FROM [Project] WHERE [ProjectID] = @ProjectID" InsertCommand="INSERT INTO [Project] ([ProjectName], [Budget], [Timeframe], [Area]) VALUES (@ProjectName, @Budget, @Timeframe, @Area)" ProviderName="<%$ ConnectionStrings:ProjectCenterConnectionString.ProviderName %>" SelectCommand="SELECT [ProjectID], [ProjectName], [Budget], [Timeframe], [Area] FROM [Project]" UpdateCommand="UPDATE [Project] SET [ProjectName] = @ProjectName, [Budget] = @Budget, [Timeframe] = @Timeframe, [Area] = @Area WHERE [ProjectID] = @ProjectID">
                <DeleteParameters>
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProjectName" Type="String" />
                    <asp:Parameter Name="Budget" Type="String" />
                    <asp:Parameter Name="Timeframe" Type="String" />
                    <asp:Parameter Name="Area" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProjectName" Type="String" />
                    <asp:Parameter Name="Budget" Type="String" />
                    <asp:Parameter Name="Timeframe" Type="String" />
                    <asp:Parameter Name="Area" Type="String" />
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </form>
      
    </main>
</body>
</html>