.class public Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
.super Ljava/lang/Object;
.source "SnapshotData.java"


# static fields
.field private static VERSION_NUMBER:J = 0x1L


# instance fields
.field private highScore:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-wide p1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->highScore:J

    return-void
.end method

.method public static deserialize(Lcom/google/android/gms/games/snapshot/Snapshot;)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 43
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/Snapshot;->getSnapshotContents()Lcom/google/android/gms/games/snapshot/SnapshotContents;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/gms/games/snapshot/SnapshotContents;->readFully()[B

    move-result-object p0

    .line 44
    invoke-static {p0}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static deserialize([B)Lcom/tpcstld/twozerogame/snapshot/SnapshotData;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 33
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    const-string p0, ","

    invoke-virtual {v0, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    .line 34
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->VERSION_NUMBER:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 37
    :cond_0
    new-instance v0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public getHighScore()J
    .locals 2

    .line 24
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->highScore:J

    return-wide v0
.end method

.method public serialize()[B
    .locals 3

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-wide v1, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->VERSION_NUMBER:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/tpcstld/twozerogame/snapshot/SnapshotData;->highScore:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method
