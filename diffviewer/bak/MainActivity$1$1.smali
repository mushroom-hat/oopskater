.class Lcom/tpcstld/twozerogame/MainActivity$1$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/MainActivity$1;->onComplete(Lcom/google/android/gms/tasks/Task;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tpcstld/twozerogame/MainActivity$1;


# direct methods
.method constructor <init>(Lcom/tpcstld/twozerogame/MainActivity$1;)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1$1;->this$1:Lcom/tpcstld/twozerogame/MainActivity$1;
    nop
    nop
    nop

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public run(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction
    .param p1    # Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1$1;->this$1:Lcom/tpcstld/twozerogame/MainActivity$1;
    nop
    nop

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;
    nop
    nop

    invoke-static {v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object v0
    nop

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop

    invoke-virtual {v0, p1}, Lcom/tpcstld/twozerogame/MainGame;->handleSnapshot(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
