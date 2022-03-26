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

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;->val$snapshotsClient:Lcom/google/android/gms/games/SnapshotsClient;
    nop
    nop
    nop

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 6

	goto/32 :after_last_instruction

	:before_first_instruction
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
    nop

    
    invoke-static {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$102(Z)Z

    
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$000(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;

    move-result-object p1
    nop
    nop
    nop

    if-nez p1, :cond_0
    nop
    nop
    nop

    return-void

    
    :cond_0
    invoke-static {}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->access$200()Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object v0
    nop
    nop
    nop

    
    invoke-static {p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object v1
    nop

    if-eqz v1, :cond_1
    nop

    
    invoke-virtual {v1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v1
    nop
    nop

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v3
    nop
    nop
    nop

    cmp-long v5, v1, v3
    nop

    if-lez v5, :cond_1
    nop

    return-void

    
    :cond_1
    invoke-interface {p1}, Lcom/google/android/gms/games/snapshot/Snapshot;->getSnapshotContents()Lcom/google/android/gms/games/snapshot/SnapshotContents;

    move-result-object v1
    nop
    nop

    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->serialize()[B

    move-result-object v2
    nop

    invoke-interface {v1, v2}, Lcom/google/android/gms/games/snapshot/SnapshotContents;->writeBytes([B)Z

    
    new-instance v1, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;
    nop
    nop
    nop

    invoke-direct {v1}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;-><init>()V

	const-string/jumbo v2, "ce68e60c6d82430ff0d77b958282a96084755480948aea68136bbe27c6b9795d"

	invoke-static {v2}, Lcom/decryptstringmanager/DecryptString;->decryptString(Ljava/lang/String;)Ljava/lang/String;

	move-result-object v2
    nop
    nop
    nop

    
    invoke-virtual {v1, v2}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->setDescription(Ljava/lang/String;)Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;

    move-result-object v1
    nop

    
    invoke-virtual {v0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->getHighScore()J

    move-result-wide v2
    nop

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->setProgressValue(J)Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;

    move-result-object v0
    nop
    nop

    
    invoke-virtual {v0}, Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange$Builder;->build()Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange;

    move-result-object v0
    nop

    
    iget-object v1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;->val$snapshotsClient:Lcom/google/android/gms/games/SnapshotsClient;
    nop

    invoke-interface {v1, p1, v0}, Lcom/google/android/gms/games/SnapshotsClient;->commitAndClose(Lcom/google/android/gms/games/snapshot/Snapshot;Lcom/google/android/gms/games/snapshot/SnapshotMetadataChange;)Lcom/google/android/gms/tasks/Task;

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
