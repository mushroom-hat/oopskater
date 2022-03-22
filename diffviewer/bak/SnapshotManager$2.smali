.class final Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;
.super Ljava/lang/Object;
.source "SnapshotManager.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->saveSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
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
.field final synthetic val$snapshotsClient:Lcom/google/android/gms/games/SnapshotsClient;


# direct methods
.method constructor <init>(Lcom/google/android/gms/games/SnapshotsClient;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;->val$snapshotsClient:Lcom/google/android/gms/games/SnapshotsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 6
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

    const/4 v0, 0x0

    .line 68
    invoke-static {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$102(Z)Z

    .line 70
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$000(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 75
    :cond_0
    invoke-static {}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$200()Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object v0

    .line 78
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 79
    invoke-virtual {v1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v1

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    return-void

    .line 83
    :cond_1
    invoke-interface {p1}, Lcom/google/android/gms/games/snapshot/Snapshot;->getSnapshotContents()Lcom/google/android/gms/games/snapshot/SnapshotContents;

    move-result-object v1

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->serialize()[B

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/games/snapshot/SnapshotContents;->writeBytes([B)Z

    .line 85
    new-instance v1, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;-><init>()V

    const-string v2, "2048 highscore save."

    .line 86
    invoke-virtual {v1, v2}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->setDescription(Ljava/lang/String;)Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;

    move-result-object v1

    .line 87
    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->setProgressValue(J)Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;

    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->build()Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange;

    move-result-object v0

    .line 90
    iget-object v1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;->val$snapshotsClient:Lcom/google/android/gms/games/SnapshotsClient;

    invoke-interface {v1, p1, v0}, Lcom/google/android/gms/games/SnapshotsClient;->commitAndClose(Lcom/google/android/gms/games/snapshot/Snapshot;Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
