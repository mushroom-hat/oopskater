.class Lcom/tpcstld/twozerogame/AnimationCell;
.super Lcom/tpcstld/twozerogame/Cell;
.source "AnimationCell.java"


# instance fields
.field private final f8da4907b:J

.field private final f8da4907bOnOXDDdP:J

.field private final f8da4907bMnPsoZqs:J

.field private final f8da4907bHNCVQBqQ:J

.field private final f8da4907bdDmtUePx:J

.field private final fac0549da:I

.field private final fac0549datlqyBaNi:I

.field private final fac0549daavdydzSk:I

.field private final fac0549daUynHYEYg:I

.field private final fae89394c:J

.field private final fae89394cTYJXKZDs:J

.field private final fae89394covcSXZcG:J

.field private final fae89394cOceCZgLn:J

.field public final f27353006:[I

.field public final f27353006YpXlnHss:[I

.field public final f27353006uOkiVOzA:[I

.field public final f27353006tDaYBbIv:[I

.field private f3a57ff01:J

.field private f3a57ff01jXNWfOiC:J

.field private f3a57ff01bTFFFMKx:J


# direct methods
.method public constructor <init>(IIIJJ[I)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    
    iput p3, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fac0549da:I
    nop

    
    iput-wide p4, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f8da4907b:J
    nop
    nop
    nop

    
    iput-wide p6, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fae89394c:J
    nop
    nop

    
    iput-object p8, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f27353006:[I
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public animationDone()Z
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f8da4907b:J
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fae89394c:J
    nop
    nop
    nop

    add-long/2addr v0, v2
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f3a57ff01:J
    nop
    nop

    cmp-long v4, v0, v2
    nop
    nop

    if-gez v4, :cond_0
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop

    goto :goto_0
    nop

    :cond_0
    const/4 v0, 0x0
    nop
    nop
    nop

    :goto_0
    return v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getAnimationType()I
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fac0549da:I
    nop
    nop
    nop

    return v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getPercentageDone()D
    .locals 4

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f3a57ff01:J
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fae89394c:J
    nop
    nop

    sub-long/2addr v0, v2
    nop

    long-to-double v0, v0
    nop
    nop

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0
    nop

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f8da4907b:J
    nop
    nop

    long-to-double v2, v2
    nop

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v2
    nop

    const-wide/16 v2, 0x0
    nop

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0
    nop

    return-wide v0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isActive()Z
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f3a57ff01:J
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fae89394c:J
    nop
    nop
    nop

    cmp-long v4, v0, v2
    nop
    nop

    if-ltz v4, :cond_0
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_0
    const/4 v0, 0x0
    nop

    :goto_0
    return v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public tick(J)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f3a57ff01:J
    nop

    add-long/2addr v0, p1
    nop

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f3a57ff01:J
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
