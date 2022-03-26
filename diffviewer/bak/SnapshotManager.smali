.class public Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;
.super Ljava/lang/Object;
.source "SnapshotManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;
    }
.end annotation


# static fields
.field private static final FILE_DESCRIPTION:Ljava/lang/String; = "2048 highscore save."

.field private static final FILE_NAME:Ljava/lang/String; = "2048"

.field private static lastSnapshot:Lcom/tpcstld/twozerogame/snapshot/SnapshotData; = null

.field private static saveInProgress:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;
    .locals 0

    .line 18
    invoke-static {p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->getSnapshotFromTask(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    .line 18
    sput-boolean p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->saveInProgress:Z

    return p0
.end method

.method static synthetic access$200()Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 1

    .line 18
    sget-object v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->lastSnapshot:Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    return-object v0
.end method

.method private static getSnapshotFromTask(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/games/snapshot/Snapshot;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict<",
            "Lcom/google/android/gms/games/snapshot/Snapshot;",
            ">;>;)",
            "Lcom/google/android/gms/games/snapshot/Snapshot;"
        }
    .end annotation

    .line 97
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 100
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict;

    invoke-virtual {p0}, Lcom/google/android/gms/games/SnapshotsClient$DataOrConflict;->getData()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/games/snapshot/Snapshot;

    return-object p0
.end method

.method public static loadSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V
    .locals 3

    .line 32
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 34
    invoke-static {p0, v0}, Lcom/google/android/gms/games/Games;->getSnapshotsClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/SnapshotsClient;

    move-result-object p0

    const/4 v0, 0x1

    const/4 v1, 0x4

    const-string v2, "2048"

    .line 35
    invoke-interface {p0, v2, v0, v1}, Lcom/google/android/gms/games/SnapshotsClient;->open(Ljava/lang/String;ZI)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;

    invoke-direct {v0, p1}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$1;-><init>(Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$Callback;)V

    .line 36
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_0
    return-void
.end method

.method public static saveSnapshot(Landroid/content/Context;Lcom/tpcstld/twozerogame/snapshot/SnapshotData;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 54
    sput-object p1, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->lastSnapshot:Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    .line 56
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 58
    sget-boolean v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->saveInProgress:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 62
    sput-boolean v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager;->saveInProgress:Z

    .line 63
    invoke-static {p0, p1}, Lcom/google/android/gms/games/Games;->getSnapshotsClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/android/gms/games/SnapshotsClient;

    move-result-object p0

    const/4 p1, 0x4

    const-string v1, "2048"

    .line 64
    invoke-interface {p0, v1, v0, p1}, Lcom/google/android/gms/games/SnapshotsClient;->open(Ljava/lang/String;ZI)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotManager$2;-><init>(Lcom/google/android/gms/games/SnapshotsClient;)V

    .line 65
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_1
    return-void
.end method
