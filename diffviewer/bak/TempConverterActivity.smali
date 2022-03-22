.class public final Ledu/singaporetech/travelapp/TempConverterActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TempConverterActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0002J\u0010\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\tH\u0002J\u0012\u0010\u000e\u001a\u00020\u000f2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0014R\u0014\u0010\u0003\u001a\u00020\u0004X\u0086D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Ledu/singaporetech/travelapp/TempConverterActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "TAG",
        "",
        "getTAG",
        "()Ljava/lang/String;",
        "covertFahrenheit",
        "convertCelsiusToFahrenheit",
        "",
        "celsius",
        "convertFahrenheitToCelsius",
        "",
        "fahrenheit",
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

.field private covertFahrenheit:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$837MevMZglFuw1LtkpOBr23kc0U(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Ledu/singaporetech/travelapp/TempConverterActivity;->onCreate$lambda-2(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Dd1V_BYiYLsm7ApEGdySAOL3nMs(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Ledu/singaporetech/travelapp/TempConverterActivity;->onCreate$lambda-3(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$iNBvmjzFnsaQyHjMFjVnnk4zVm8(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Ledu/singaporetech/travelapp/TempConverterActivity;->onCreate$lambda-0(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$r-OThVpWErbvcwnXMgnmxdkrj6A(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Ledu/singaporetech/travelapp/TempConverterActivity;->onCreate$lambda-1(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 14
    const-string v0, "TempConverter"

    iput-object v0, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->TAG:Ljava/lang/String;

    .line 15
    const-string v0, "True"

    iput-object v0, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    .line 12
    return-void
.end method

.method private final convertCelsiusToFahrenheit(F)F
    .locals 2
    .param p1, "celsius"    # F

    .line 87
    const/16 v0, 0x9

    int-to-float v0, v0

    mul-float v0, v0, p1

    const/4 v1, 0x5

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/16 v1, 0x20

    int-to-float v1, v1

    add-float/2addr v0, v1

    return v0
.end method

.method private final convertFahrenheitToCelsius(F)D
    .locals 4
    .param p1, "fahrenheit"    # F

    .line 77
    const/16 v0, 0x20

    int-to-float v0, v0

    sub-float v0, p1, v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x4014000000000000L    # 5.0

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4022000000000000L    # 9.0

    div-double/2addr v0, v2

    return-wide v0
.end method

.method private static final onCreate$lambda-0(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/TempConverterActivity;
    .param p1, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    iget-object v0, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    const-string v1, "False"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "True"

    if-eqz v0, :cond_0

    .line 25
    iput-object v2, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    .line 26
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 28
    :cond_0
    iput-object v2, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    .line 29
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    :goto_0
    return-void
.end method

.method private static final onCreate$lambda-1(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/TempConverterActivity;
    .param p1, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    const-string v0, "False"

    iput-object v0, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    .line 36
    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 37
    return-void
.end method

.method private static final onCreate$lambda-2(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 8
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/TempConverterActivity;
    .param p1, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    const v0, 0x7f080181

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    check-cast v0, Landroid/widget/EditText;

    .line 43
    .local v0, "editText":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "temperatureInput":Ljava/lang/String;
    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    const-string v3, "Converting "

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->stringPlus(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 45
    const-string v2, ""

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    const-string v3, "Please enter a input."

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 48
    :cond_0
    iget-object v2, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->covertFahrenheit:Ljava/lang/String;

    const-string v3, "True"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const-string v3, " Fahrenheit"

    const-string v4, " Celsius is "

    const v5, 0x7f080137

    if-eqz v2, :cond_1

    .line 49
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-direct {p0, v2}, Ledu/singaporetech/travelapp/TempConverterActivity;->convertCelsiusToFahrenheit(F)F

    move-result v2

    .line 50
    .local v2, "fahrenheit":F
    invoke-virtual {p0, v5}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 51
    .local v5, "displayTemp":Landroid/widget/TextView;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .end local v2    # "fahrenheit":F
    .end local v5    # "displayTemp":Landroid/widget/TextView;
    goto :goto_0

    .line 53
    :cond_1
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-direct {p0, v2}, Ledu/singaporetech/travelapp/TempConverterActivity;->convertFahrenheitToCelsius(F)D

    move-result-wide v6

    .line 54
    .local v6, "celsius":D
    invoke-virtual {p0, v5}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 55
    .local v2, "displayTemp":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .end local v2    # "displayTemp":Landroid/widget/TextView;
    .end local v6    # "celsius":D
    :goto_0
    return-void

    .line 42
    .end local v0    # "editText":Landroid/widget/EditText;
    .end local v1    # "temperatureInput":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null cannot be cast to non-null type android.widget.EditText"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final onCreate$lambda-3(Ledu/singaporetech/travelapp/TempConverterActivity;Landroid/view/View;)V
    .locals 5
    .param p0, "this$0"    # Ledu/singaporetech/travelapp/TempConverterActivity;
    .param p1, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    const v0, 0x7f080137

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 66
    .local v0, "displayTemp":Landroid/widget/TextView;
    const-string v1, ""

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    const v1, 0x7f080181

    invoke-virtual {p0, v1}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    check-cast v1, Landroid/widget/EditText;

    .line 69
    .local v1, "editText":Landroid/widget/EditText;
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->clear()V

    .line 71
    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    const-string v3, "Cleared."

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 72
    return-void

    .line 68
    .end local v1    # "editText":Landroid/widget/EditText;
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "null cannot be cast to non-null type android.widget.EditText"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final getTAG()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Ledu/singaporetech/travelapp/TempConverterActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 18
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const v0, 0x7f0b001f

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/TempConverterActivity;->setContentView(I)V

    .line 21
    const v0, 0x7f080133

    invoke-virtual {p0, v0}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.widget.Button"

    if-eqz v0, :cond_3

    check-cast v0, Landroid/widget/Button;

    .line 23
    .local v0, "radioButtonFahrenheit":Landroid/widget/Button;
    new-instance v2, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda2;-><init>(Ledu/singaporetech/travelapp/TempConverterActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    const v2, 0x7f080132

    invoke-virtual {p0, v2}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_2

    check-cast v2, Landroid/widget/Button;

    .line 34
    .local v2, "radioButtonCelsius":Landroid/widget/Button;
    new-instance v3, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda3;-><init>(Ledu/singaporetech/travelapp/TempConverterActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    const v3, 0x7f08005b

    invoke-virtual {p0, v3}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    check-cast v3, Landroid/widget/Button;

    .line 41
    .local v3, "convertButton":Landroid/widget/Button;
    new-instance v4, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0}, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda0;-><init>(Ledu/singaporetech/travelapp/TempConverterActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    const v4, 0x7f080059

    invoke-virtual {p0, v4}, Ledu/singaporetech/travelapp/TempConverterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_0

    move-object v1, v4

    check-cast v1, Landroid/widget/Button;

    .line 64
    .local v1, "clearButton":Landroid/widget/Button;
    new-instance v4, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Ledu/singaporetech/travelapp/TempConverterActivity$$ExternalSyntheticLambda1;-><init>(Ledu/singaporetech/travelapp/TempConverterActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    return-void

    .line 62
    .end local v1    # "clearButton":Landroid/widget/Button;
    :cond_0
    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 39
    .end local v3    # "convertButton":Landroid/widget/Button;
    :cond_1
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 32
    .end local v2    # "radioButtonCelsius":Landroid/widget/Button;
    :cond_2
    new-instance v2, Ljava/lang/NullPointerException;

    invoke-direct {v2, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 21
    .end local v0    # "radioButtonFahrenheit":Landroid/widget/Button;
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
