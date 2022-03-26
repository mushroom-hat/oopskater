.class final Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;
.super Ljava/lang/Object;
.source "SnapshotManager.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict<",
        "Lcom/google/android/gms/games/snapshot/Snapshot;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;


# direct methods
.method constructor <init>(Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;->val$callback:Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict<",
            "Lcom/google/android/gms/games/snapshot/Snapshot;",
            ">;>;)V"
        }
    .end annotation

    .line 39
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$000(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 44
    :cond_0
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 46
    iget-object v0, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;->val$callback:Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;

    invoke-interface {v0, p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;->run(Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V

    :cond_1
    return-void
.end method
