.class Lcom/tpcstld/twozerogame/AnimationCell;
.super Lcom/tpcstld/twozerogame/Cell;
.source "AnimationCell.java"


# instance fields
.field private final animationTime:J

.field private final animationType:I

.field private final delayTime:J

.field public final extras:[I

.field private timeElapsed:J


# direct methods
.method public constructor <init>(IIIJJ[I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    .line 12
    iput p3, p0, Lcom/tpcstld/twozerogame/AnimationCell;->animationType:I

    .line 13
    iput-wide p4, p0, Lcom/tpcstld/twozerogame/AnimationCell;->animationTime:J

    .line 14
    iput-wide p6, p0, Lcom/tpcstld/twozerogame/AnimationCell;->delayTime:J

    .line 15
    iput-object p8, p0, Lcom/tpcstld/twozerogame/AnimationCell;->extras:[I

    return-void
.end method


# virtual methods
.method public animationDone()Z
    .locals 5

    .line 27
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->animationTime:J

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->delayTime:J

    add-long/2addr v0, v2

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->timeElapsed:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getAnimationType()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->animationType:I

    return v0
.end method

.method public getPercentageDone()D
    .locals 4

    .line 31
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->timeElapsed:J

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->delayTime:J

    sub-long/2addr v0, v2

    long-to-double v0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->animationTime:J

    long-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public isActive()Z
    .locals 5

    .line 35
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->timeElapsed:J

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->delayTime:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public tick(J)V
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->timeElapsed:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->timeElapsed:J

    return-void
.end method
