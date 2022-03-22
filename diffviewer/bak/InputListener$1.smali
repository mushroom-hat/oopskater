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

    .line 126
    iput-object p1, p0, Lcom/tpcstld/twozerogame/InputListener$1;->this$0:Lcom/tpcstld/twozerogame/InputListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 129
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener$1;->this$0:Lcom/tpcstld/twozerogame/InputListener;

    invoke-static {p1}, Lcom/tpcstld/twozerogame/InputListener;->access$000(Lcom/tpcstld/twozerogame/InputListener;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object p1

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->newGame()V

    return-void
.end method
