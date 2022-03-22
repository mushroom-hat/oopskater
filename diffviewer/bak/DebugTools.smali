.class Lcom/tpcstld/twozerogame/DebugTools;
.super Ljava/lang/Object;
.source "DebugTools.java"


# static fields
.field private static final DEBUG_ENABLED:Z = false

.field private static final PREMADE_MAP:[[I

.field private static final STARTING_SCORE:J = 0x2697dcL


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x4

    .line 17
    new-array v1, v0, [[I

    new-array v2, v0, [I

    fill-array-data v2, :array_0

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v2, v0, [I

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-array v2, v0, [I

    fill-array-data v2, :array_2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    const/4 v2, 0x3

    aput-object v0, v1, v2

    sput-object v1, Lcom/tpcstld/twozerogame/DebugTools;->PREMADE_MAP:[[I

    return-void

    :array_0
    .array-data 4
        0x80
        0x100
        0x8000
        0x20000
    .end array-data

    :array_1
    .array-data 4
        0x8
        0x10
        0x0
        0x2
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x2
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static generatePremadeMap()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tpcstld/twozerogame/Tile;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method static getStartingScore()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method
