.class Lcom/tpcstld/twozerogame/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/MainActivity;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tpcstld/twozerogame/MainActivity;


# direct methods
.method constructor <init>(Lcom/tpcstld/twozerogame/MainActivity;)V
    .locals 0

    .line 223
    iput-object p1, p0, Lcom/tpcstld/twozerogame/MainActivity$2;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

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

    .line 226
    iget-object v0, p0, Lcom/tpcstld/twozerogame/MainActivity$2;->this$0:Lcom/tpcstld/twozerogame/MainActivity;

    invoke-static {v0}, Lcom/tpcstld/twozerogame/MainActivity;->access$100(Lcom/tpcstld/twozerogame/MainActivity;)Lcom/tpcstld/twozerogame/MainView;

    move-result-object v0

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->game:Lcom/tpcstld/twozerogame/MainGame;

    invoke-virtual {v0, p1}, Lcom/tpcstld/twozerogame/MainGame;->handleSnapshot(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V

    return-void
.end method