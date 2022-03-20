.class public final Ledu/singaporetech/travelapp/EmailActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "EmailActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0002J\u0012\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0014J\u0016\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0004R\u0014\u0010\u0003\u001a\u00020\u0004X\u0086D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0011"
    }
    d2 = {
        "Ledu/singaporetech/travelapp/EmailActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "TAG",
        "",
        "getTAG",
        "()Ljava/lang/String;",
        "createEmailMessage",
        "name",
        "city",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "sendEmail",
        "email",
        "msg",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$Da-EpdhGQxmy1qn1hnlWwNrLksA(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Ledu/singaporetech/travelapp/EmailActivity;->onCreate$lambda-0(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$H2Gl-q9jgR1lZjkq-a6sx_b0HQA(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Ledu/singaporetech/travelapp/EmailActivity;->onCreate$lambda-1(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 17
    const-string v0, "EmailActivity"

    iput-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->TAG:Ljava/lang/String;

    .line 15
    return-void
.end method

.method private final createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "city"    # Ljava/lang/String;

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Hey "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " I\'m going to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "emailMessage":Ljava/lang/String;
    return-object v0
.end method

.method private static final onCreate$lambda-0(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 2
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/EmailActivity;
    .param p1, "$nameField"    # Landroid/widget/EditText;
    .param p2, "$cityField"    # Landroid/widget/EditText;
    .param p3, "$msgPreview"    # Landroid/widget/TextView;
    .param p4, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "msg":Ljava/lang/String;
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    return-void
.end method

.method private static final onCreate$lambda-1(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 2
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/EmailActivity;
    .param p1, "$nameField"    # Landroid/widget/EditText;
    .param p2, "$cityField"    # Landroid/widget/EditText;
    .param p3, "$emailField"    # Landroid/widget/EditText;
    .param p4, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Ledu/singaporetech/travelapp/EmailActivity;->sendEmail(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    return-void
.end method


# virtual methods
.method public final getTAG()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 20
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    const v0, 0x7f0b001d

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->setContentView(I)V

    .line 28
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->TAG:Ljava/lang/String;

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->TAG:Ljava/lang/String;

    const-string v1, "Jeannie"

    const-string v2, "Los Angeles"

    invoke-direct {p0, v1, v2}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    const v0, 0x7f0800fc

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 32
    .local v0, "previewBtn":Landroid/widget/Button;
    const v1, 0x7f080156

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 33
    .local v1, "sendMailBtn":Landroid/widget/Button;
    const v2, 0x7f0800fb

    invoke-virtual {p0, v2}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 34
    .local v2, "msgPreview":Landroid/widget/TextView;
    const v3, 0x7f08009d

    invoke-virtual {p0, v3}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 35
    .local v3, "nameField":Landroid/widget/EditText;
    const v4, 0x7f08009a

    invoke-virtual {p0, v4}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 36
    .local v4, "cityField":Landroid/widget/EditText;
    const v5, 0x7f08009c

    invoke-virtual {p0, v5}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 38
    .local v5, "emailField":Landroid/widget/EditText;
    new-instance v6, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda1;

    invoke-direct {v6, p0, v3, v4, v2}, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda1;-><init>(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    new-instance v6, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0, v3, v4, v5}, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda0;-><init>(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    return-void
.end method

.method public final sendEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    const-string v0, "email"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "msg"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object v1, v0

    .local v1, "$this$sendEmail_u24lambda_u2d2":Landroid/content/Intent;
    const/4 v2, 0x0

    .line 62
    .local v2, "$i$a$-apply-EmailActivity$sendEmail$intent$1":I
    const-string v3, "*/*"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    const-string v3, "android.intent.extra.EMAIL"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 64
    const-string v3, "android.intent.extra.SUBJECT"

    const-string v4, "Going on vacation!"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    const-string v3, "android.intent.extra.TEXT"

    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    nop

    .line 61
    .end local v1    # "$this$sendEmail_u24lambda_u2d2":Landroid/content/Intent;
    .end local v2    # "$i$a$-apply-EmailActivity$sendEmail$intent$1":I
    nop

    .line 67
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Ledu/singaporetech/travelapp/EmailActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->startActivity(Landroid/content/Intent;)V

    .line 70
    :cond_0
    return-void
.end method
