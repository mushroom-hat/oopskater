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
.field private final TAG:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$CYT8cBLMJ1Uun-6MH-5Rtcnawdo(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    invoke-static/range {p0 .. p5}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 16
    const-string v0, "CurrencyConverterActivity"

    iput-object v0, p0, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->TAG:Ljava/lang/String;

    .line 14
    return-void
.end method

.method private final calculateRate(FF)F
    .locals 1
    .param p1, "value"    # F
    .param p2, "exchangeRate"    # F

    .line 54
    mul-float v0, p1, p2

    .line 56
    .local v0, "res":F
    return v0
.end method

.method private static final onCreate$lambda-0(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 6
    .param p0, "$editTextSingDollar"    # Landroid/widget/EditText;
    .param p1, "$editTextRate"    # Landroid/widget/EditText;
    .param p2, "$editTextCurrency"    # Landroid/widget/EditText;
    .param p3, "this$0"    # Ledu/singaporetech/travelapp/CurrencyConverterActivity;
    .param p4, "$textViewResult"    # Landroid/widget/TextView;
    .param p5, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "valueOf(editTextSingDollar.getText().toString())"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 36
    .local v0, "value":F
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    const-string v2, "valueOf(editTextRate.getText().toString())"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    .line 37
    .local v1, "exchangeRate":F
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 38
    .local v2, "currency":Ljava/lang/String;
    invoke-direct {p3, v0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->calculateRate(FF)F

    move-result v3

    .line 41
    .local v3, "res":F
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, " SGD is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {p4, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    const/4 v4, 0x0

    invoke-virtual {p4, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 44
    return-void
.end method


# virtual methods
.method public final getTAG()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 19
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    const v0, 0x7f0b001c

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->setContentView(I)V

    .line 23
    const v0, 0x7f08009b

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 24
    .local v0, "editTextCurrency":Landroid/widget/EditText;
    const v1, 0x7f08009e

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/EditText;

    .line 25
    .local v7, "editTextRate":Landroid/widget/EditText;
    const v1, 0x7f08009f

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/EditText;

    .line 26
    .local v8, "editTextSingDollar":Landroid/widget/EditText;
    const v1, 0x7f08005a

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/Button;

    .line 27
    .local v9, "button_convert":Landroid/widget/Button;
    const v1, 0x7f08018f

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/CurrencyConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/TextView;

    .line 32
    .local v10, "textViewResult":Landroid/widget/TextView;
    new-instance v11, Ledu/singaporetech/travelapp/CurrencyConverterActivity$$ExternalSyntheticLambda0;

    move-object v1, v11

    move-object v2, v8

    move-object v3, v7

    move-object v4, v0

    move-object v5, p0

    move-object v6, v10

    invoke-direct/range {v1 .. v6}, Ledu/singaporetech/travelapp/CurrencyConverterActivity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ledu/singaporetech/travelapp/CurrencyConverterActivity;Landroid/widget/TextView;)V

    invoke-virtual {v9, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    return-void
.end method
