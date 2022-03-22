.class public final Lcom/example/myapplication/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0014\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/example/myapplication/MainActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x1,
        0x5,
        0x1
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    
    const v0, 0x7f0b001c
    nop

    invoke-virtual {p0, v0}, Lcom/example/myapplication/MainActivity;->setContentView(I)V

    
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    nop
    nop

	const-string/jumbo v1, "c2c42fb7a8b7b0730bd9a1d62f7b6dc26fe7f8a33a31be934c73d25e498bd44a"

	invoke-static {v1}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v1
    nop

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    
    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
