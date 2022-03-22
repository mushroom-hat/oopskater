.class public final Ledu/singaporetech/travelapp/CurrencyConverterActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "CurrencyConverterActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u0008H\u0002J\u0012\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0014R\u0014\u0010\u0003\u001a\u00020\u0004X\u0086D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u000f"
    }
    d2 = {
        "Ledu/singaporetech/travelapp/CurrencyConverterActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "TAG",
        "",
        "getTAG",
        "()Ljava/lang/String;",
        "calculateRate",
        "",
        "value",
        "exchangeRate",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
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

.field private final fe444f739NEkxirET:Ljava/lang/String;

.field private final fe444f739QsQLjbGc:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$CYT8cBLMJ1Uun-6MH-5Rtcnawdo(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;FBCI)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method public static synthetic $r8$lambda$CYT8cBLMJ1Uun-6MH-5Rtcnawdo(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;BCFI)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method public static synthetic $r8$lambda$CYT8cBLMJ1Uun-6MH-5Rtcnawdo(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;BCIF)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method public static synthetic $r8$lambda$CYT8cBLMJ1Uun-6MH-5Rtcnawdo(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    invoke-static/range {p0 .. p5}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public constructor <init>()V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    
	const-string/jumbo v0, "8594c21e12a67a53d6ae40f54916e1672bb96a3e0a3aa1cfef33f0816b8e6f9c"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop

    iput-object v0, p0, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->fe444f739:Ljava/lang/String;
    nop
    nop
    nop

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private final calculateRate(FFZBIS)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private final calculateRate(FFBSIZ)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private final calculateRate(FFBSZI)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private final calculateRate(FF)F
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "value"    # F
    .param p2, "exchangeRate"    # F

    
    mul-float v0, p1, p2
    nop

    
    .local v0, "res":F
    return v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private static final onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;BFIS)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private static final onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;BSFI)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private static final onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;BFSI)V
    .locals 0

    const/16 p0, 0x2a

    const/16 p1, 0xd2

    mul-int p2, p0, p1

    add-int p3, p2, p1

    int-to-double p0, p3

    return-void
.end method

.method private static final onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p0, "$editTextSingDollar"    # Landroid/widget/EditText;
    .param p1, "$editTextRate"    # Landroid/widget/EditText;
    .param p2, "$editTextCurrency"    # Landroid/widget/EditText;
    .param p3, "this$0"    # Ledu/singaporetech/travelapp/CurrencyConverterActivity;
    .param p4, "$textViewResult"    # Landroid/widget/TextView;
    .param p5, "it"    # Landroid/view/View;

	const-string/jumbo v0, "3c16f5e70e9657a0e5c5500132907dbf"

	invoke-static {v0}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v0
    nop
    nop
    nop

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0
    nop
    nop
    nop

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    nop
    nop
    nop

    invoke-static {v0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0
    nop
    nop
    nop

	const-string/jumbo v1, "5cb78ffb7ab10bc9b794695c5a7828fa5a748372a307fb9cb591e713de56370b91d3c451b2868f18b50a8880271300af732cec7b7d4a46547e22c5411b2432bd"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Number;
    nop

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0
    nop
    nop
    nop

    
    .local v0, "value":F
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1
    nop
    nop
    nop

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1
    nop
    nop
    nop

    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1
    nop
    nop

	const-string/jumbo v2, "5cb78ffb7ab10bc9b794695c5a7828fad3480484ff1356e32dea5524530677a1898f50371a962ff9b191f3328340fbae"

	invoke-static {v2}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v2
    nop
    nop
    nop

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Number;
    nop
    nop
    nop

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1
    nop

    
    .local v1, "exchangeRate":F
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2
    nop
    nop

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2
    nop

    
    .local v2, "currency":Ljava/lang/String;
    invoke-direct {p3, v0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->calculateRate(FF)F

    move-result v3
    nop
    nop
    nop

    
    .local v3, "res":F
    new-instance v4, Ljava/lang/StringBuilder;
    nop
    nop
    nop

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

	const-string/jumbo v5, "5def58bdcf1df88346de9fd0155bf55f"

	invoke-static {v5}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v5
    nop
    nop
    nop

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v5, 0x20
    nop
    nop
    nop

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    nop

    check-cast v4, Ljava/lang/CharSequence;
    nop

    invoke-virtual {p4, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    
    const/4 v4, 0x0
    nop
    nop

    invoke-virtual {p4, v4}, Landroid/widget/TextView;->setVisibility(I)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public final getTAG()Ljava/lang/String;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object v0, p0, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->fe444f739:Ljava/lang/String;
    nop

    return-object v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    
    const v0, 0x7f0b001c
    nop
    nop
    nop

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->setContentView(I)V

    
    const v0, 0x7f08009b
    nop
    nop
    nop

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0
    nop
    nop
    nop

    check-cast v0, Landroid/widget/EditText;
    nop
    nop
    nop

    
    .local v0, "editTextCurrency":Landroid/widget/EditText;
    const v1, 0x7f08009e
    nop
    nop
    nop

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1
    nop

    move-object v7, v1
    nop

    check-cast v7, Landroid/widget/EditText;
    nop

    
    .local v7, "editTextRate":Landroid/widget/EditText;
    const v1, 0x7f08009f
    nop

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1
    nop

    move-object v8, v1
    nop

    check-cast v8, Landroid/widget/EditText;
    nop
    nop
    nop

    
    .local v8, "editTextSingDollar":Landroid/widget/EditText;
    const v1, 0x7f08005a
    nop
    nop

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1
    nop

    move-object v9, v1
    nop

    check-cast v9, Landroid/widget/Button;
    nop
    nop

    
    .local v9, "button_convert":Landroid/widget/Button;
    const v1, 0x7f08018f
    nop
    nop
    nop

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1
    nop
    nop
    nop

    move-object v10, v1
    nop

    check-cast v10, Landroid/widget/TextView;
    nop

    
    .local v10, "textViewResult":Landroid/widget/TextView;
    new-instance v11, Ledu/singaporetech/travelapp/CurrencyConverterActivity$$ExternalSyntheticLambda0;
    nop
    nop
    nop

    move-object v1, v11
    nop
    nop

    move-object v2, v8
    nop
    nop

    move-object v3, v7
    nop

    move-object v4, v0
    nop

    move-object v5, p0
    nop

    move-object v6, v10
    nop
    nop

    invoke-direct/range {v1 .. v6}, Ledu/singaporetech/travelapp/CurrencyConverterActivity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;)V

    invoke-virtual {v9, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
