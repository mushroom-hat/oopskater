.class Lcom/tpcstld/twozerogame/InputListener$1;
.super Ljava/lang/Object;
.source "InputListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/InputListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tpcstld/twozerogame/InputListener;


# direct methods
.method constructor <init>(Lcom/tpcstld/twozerogame/InputListener;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/InputListener$1;->this$0:Lcom/tpcstld/twozerogame/InputListener;
    nop
    nop
    nop
    nop
    nop

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener$1;->this$0:Lcom/tpcstld/twozerogame/InputListener;
    nop
    nop
    nop
    nop

    invoke-static {p1}, Lcom/tpcstld/twozerogame/InputListener;->access$000(Lcom/tpcstld/twozerogame/InputListener;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object p1
    nop
    nop
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fcf43892a:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->newGame()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method
