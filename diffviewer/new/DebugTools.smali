.class Lcom/tpcstld/twozerogame/DebugTools;
.super Ljava/lang/Object;
.source "DebugTools.java"


# static fields
.field private static final f973f317d:Z = false

.field private static final f973f317dUgTrDuQy:Z = false

.field private static final fda0e57d8:[[I

.field private static final fda0e57d8uCPlcSxs:[[I

.field private static final fda0e57d8dDPcMzAy:[[I

.field private static final f01bfe9db:J = 0x2697dcL

.field private static final f01bfe9dbOMfuIICZ:J = 0x2697dcL

.field private static final f01bfe9dbjMZaFEuE:J = 0x2697dcL

.field private static final f01bfe9dbtWYEMfFN:J = 0x2697dcL


# direct methods
.method static constructor <clinit>()V
    .locals 4

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x4
    nop
    nop
    nop

    
    new-array v1, v0, [[I
    nop

    new-array v2, v0, [I
    nop

    fill-array-data v2, :array_0

    const/4 v3, 0x0
    nop

    aput-object v2, v1, v3
    nop
    nop

    new-array v2, v0, [I
    nop

    fill-array-data v2, :array_1

    const/4 v3, 0x1
    nop
    nop

    aput-object v2, v1, v3
    nop
    nop

    new-array v2, v0, [I
    nop

    fill-array-data v2, :array_2

    const/4 v3, 0x2
    nop
    nop

    aput-object v2, v1, v3
    nop
    nop
    nop

    new-array v0, v0, [I
    nop
    nop
    nop

    fill-array-data v0, :array_3

    const/4 v2, 0x3
    nop
    nop

    aput-object v0, v1, v2
    nop

    sput-object v1, Lcom/tpcstld/twozerogame/DebugTools;->fda0e57d8:[[I
    nop

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

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method constructor <init>()V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static generatePremadeMap()Ljava/util/List;
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction
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
    nop
    nop

    return-object v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static getStartingScore()J
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    const-wide/16 v0, 0x0
    nop
    nop

    return-wide v0
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
