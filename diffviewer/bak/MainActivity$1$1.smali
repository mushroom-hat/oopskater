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

    .line 189
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$1$1;->this$1:Lcom/tpcstld/twozerogame/MainActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
    .locals 1
    .param p1    # Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 192
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$1$1;->this$1:Lcom/tpcstld/twozerogame/MainActivity$1;

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainActivity$1;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    invoke-static {v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object v0

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0, p1}, Lcom/tpcstld/twozerogame/MainGame;->handleSnapshot(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V

    return-void
.end method