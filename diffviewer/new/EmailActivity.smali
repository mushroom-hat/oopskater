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
.field private final fe444f739:Ljava/lang/String;

.field private final fe444f739PzJbyRaM:Ljava/lang/String;

.field private final fe444f739IHSlTcPY:Ljava/lang/String;

.field private final fe444f739AewsmoBj:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$Da-EpdhGQxmy1qn1hnlWwNrLksA(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    invoke-static {p0, p1, p2, p3, p4}, Ledu/singaporetech/travelapp/EmailActivity;->onCreate$lambda-0(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public static synthetic $r8$lambda$H2Gl-q9jgR1lZjkq-a6sx_b0HQA(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    invoke-static {p0, p1, p2, p3, p4}, Ledu/singaporetech/travelapp/EmailActivity;->onCreate$lambda-1(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>()V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    
	const-string/jumbo v0, "3f21b8ec60a2fb7adcc9d7bf69a8dd8e"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop

    iput-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->fe444f739:Ljava/lang/String;
    nop
    nop

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private final createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "city"    # Ljava/lang/String;

    
    new-instance v0, Ljava/lang/StringBuilder;
    nop
    nop

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

	const-string/jumbo v1, "63da6e75be078cb1ffabbbe325476963"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

	const-string/jumbo v1, "52875f3c477dacb746160d6d4beee7f5"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x21
    nop
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    nop
    nop

    
    .local v0, "emailMessage":Ljava/lang/String;
    return-object v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private static final onCreate$lambda-0(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/EmailActivity;
    .param p1, "$nameField"    # Landroid/widget/EditText;
    .param p2, "$cityField"    # Landroid/widget/EditText;
    .param p3, "$msgPreview"    # Landroid/widget/TextView;
    .param p4, "it"    # Landroid/view/View;

	const-string/jumbo v0, "3c16f5e70e9657a0e5c5500132907dbf"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0
    nop
    nop

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    nop

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1
    nop

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1
    nop

    invoke-direct {p0, v0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    nop
    nop
    nop

    
    .local v0, "msg":Ljava/lang/String;
    move-object v1, v0
    nop
    nop

    check-cast v1, Ljava/lang/CharSequence;
    nop
    nop
    nop

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private static final onCreate$lambda-1(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/view/View;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/EmailActivity;
    .param p1, "$nameField"    # Landroid/widget/EditText;
    .param p2, "$cityField"    # Landroid/widget/EditText;
    .param p3, "$emailField"    # Landroid/widget/EditText;
    .param p4, "it"    # Landroid/view/View;

	const-string/jumbo v0, "3c16f5e70e9657a0e5c5500132907dbf"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0
    nop
    nop
    nop

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    nop
    nop
    nop

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1
    nop
    nop

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1
    nop
    nop

    invoke-direct {p0, v0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    nop
    nop

    
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1
    nop
    nop
    nop

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1
    nop

    invoke-virtual {p0, v1, v0}, Ledu/singaporetech/travelapp/EmailActivity;->sendEmail(Ljava/lang/String;Ljava/lang/String;)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public final getTAG()Ljava/lang/String;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->fe444f739:Ljava/lang/String;
    nop
    nop

    return-object v0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    
    const v0, 0x7f0b001d
    nop
    nop
    nop

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->setContentView(I)V

    
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->fe444f739:Ljava/lang/String;
    nop

	const-string/jumbo v1, "8be3084e813a9239218f43d763fbb668"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    
    iget-object v0, p0, Ledu/singaporetech/travelapp/EmailActivity;->fe444f739:Ljava/lang/String;
    nop

	const-string/jumbo v1, "8ca504bde99b96d946f2c43f02c2ca8f"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop
    nop
    nop

	const-string/jumbo v2, "8df2e4e32fb52673fbe00a9bbfad04c8"

	invoke-static {v2}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v2
    nop

    invoke-direct {p0, v1, v2}, Ledu/singaporetech/travelapp/EmailActivity;->createEmailMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    nop
    nop
    nop

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    
    const v0, 0x7f0800fc
    nop
    nop
    nop

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0
    nop
    nop

    check-cast v0, Landroid/widget/Button;
    nop
    nop
    nop

    
    .local v0, "previewBtn":Landroid/widget/Button;
    const v1, 0x7f080156
    nop
    nop
    nop

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1
    nop

    check-cast v1, Landroid/widget/Button;
    nop
    nop

    
    .local v1, "sendMailBtn":Landroid/widget/Button;
    const v2, 0x7f0800fb
    nop

    invoke-virtual {p0, v2}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2
    nop
    nop
    nop

    check-cast v2, Landroid/widget/TextView;
    nop

    
    .local v2, "msgPreview":Landroid/widget/TextView;
    const v3, 0x7f08009d
    nop

    invoke-virtual {p0, v3}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3
    nop
    nop
    nop

    check-cast v3, Landroid/widget/EditText;
    nop

    
    .local v3, "nameField":Landroid/widget/EditText;
    const v4, 0x7f08009a
    nop
    nop

    invoke-virtual {p0, v4}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4
    nop
    nop
    nop

    check-cast v4, Landroid/widget/EditText;
    nop
    nop

    
    .local v4, "cityField":Landroid/widget/EditText;
    const v5, 0x7f08009c
    nop
    nop

    invoke-virtual {p0, v5}, Ledu/singaporetech/travelapp/EmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5
    nop
    nop

    check-cast v5, Landroid/widget/EditText;
    nop
    nop

    
    .local v5, "emailField":Landroid/widget/EditText;
    new-instance v6, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda1;
    nop
    nop

    invoke-direct {v6, p0, v3, v4, v2}, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda1;-><init>(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    
    new-instance v6, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda0;
    nop

    invoke-direct {v6, p0, v3, v4, v5}, Ledu/singaporetech/travelapp/EmailActivity$$ExternalSyntheticLambda0;-><init>(Ledu/singaporetech/travelapp/EmailActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public final sendEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

	const-string/jumbo v0, "e240a09b9eb2a8ed3b6087703c1fbbb3"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop
    nop

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

	const-string/jumbo v0, "d6eaaed61a3121367530b5d550a6c565"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    
    new-instance v0, Landroid/content/Intent;
    nop

	const-string/jumbo v1, "7a1074d91a0a233c1b6ebfd3a8adb59d6f118a3ce2b0e9e13335fbf94e8153a2"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    move-object v1, v0
    nop

    .local v1, "$this$sendEmail_u24lambda_u2d2":Landroid/content/Intent;
    const/4 v2, 0x0
    nop
    nop
    nop

    
    .local v2, "$i$a$-apply-EmailActivity$sendEmail$intent$1":I
	const-string/jumbo v3, "cb84898c5514a89402aa4c7850bb1010"

	invoke-static {v3}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v3
    nop
    nop
    nop

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    
	const-string/jumbo v3, "213c4d380b6046f0aeab03fb45e9d9df49435c79fd3059dd8e49bc34231314f0"

	invoke-static {v3}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v3
    nop

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    
	const-string/jumbo v3, "213c4d380b6046f0aeab03fb45e9d9df74f0fab37d6a8b144ab6377733581917"

	invoke-static {v3}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v3
    nop
    nop

	const-string/jumbo v4, "2c91e83ec1e0aff0cc0e678adb4c51791fc8ae1f296276dff78e6d7c3a793e90"

	invoke-static {v4}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v4
    nop
    nop

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    
	const-string/jumbo v3, "213c4d380b6046f0aeab03fb45e9d9dfbb7b4de9faeae2e3db24dc7380108708"

	invoke-static {v3}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v3
    nop
    nop

    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    
    nop

    
    .end local v1    # "$this$sendEmail_u24lambda_u2d2":Landroid/content/Intent;
    .end local v2    # "$i$a$-apply-EmailActivity$sendEmail$intent$1":I
    nop

    
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Ledu/singaporetech/travelapp/EmailActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1
    nop

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1
    nop
    nop

    if-eqz v1, :cond_0
    nop
    nop

    
    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/EmailActivity;->startActivity(Landroid/content/Intent;)V

    
    :cond_0
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
