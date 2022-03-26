.class Lcom/tpcstld/twozerogame/AnimationCell;
.super Lcom/tpcstld/twozerogame/Cell;
.source "AnimationCell.java"


# instance fields
.field private final f7395fa6d:J

.field private final f7395fa6dRJFUudJj:J

.field private final f7395fa6dQpqXZusn:J

.field private final fd8361596:J

.field private final fd8361596SLFcaMIq:J

.field private final fd8361596ujyANgRs:J

.field private final fd8361596mxrVFNUF:J

.field private final f70c06e5b:J

.field private final f70c06e5bUKPhYlMV:J

.field private final f70c06e5bDgzrcwbs:J

.field private final f625c771b:I

.field private final f625c771bOPLTQGYX:I

.field private final f625c771btWTQdfle:I

.field private final f625c771bRWJYyxpk:I

.field private final f625c771bOdJEqUzd:I

.field private final f29dad1f9:I

.field private final f29dad1f9swAfrnkI:I

.field private final f29dad1f9HGTsiASQ:I

.field private final f247df2b4:J

.field private final f247df2b4ykBeRbYx:J

.field private final f247df2b4pjeHcwVJ:J

.field private final fc8986b80:J

.field private final fc8986b80oFfpGTNM:J

.field private final fc8986b80ATdbNxDW:J

.field private final fc8986b80CfrOpfyJ:J

.field public final fb38b00d9:[I

.field public final fb38b00d9pEAcPnpF:[I

.field public final fb38b00d9iKFZJSeU:[I

.field public final fb38b00d9uScJUeQP:[I

.field public final fb38b00d9xByJYpAo:[I

.field public final fade3bf62:[I

.field public final fade3bf62DBiqfnxl:[I

.field public final fade3bf62QNLTpZrA:[I

.field public final ffeddb35e:[I

.field public final ffeddb35egqxiyLHH:[I

.field public final f6a739e4e:[I

.field public final f6a739e4eEsRorjNV:[I

.field public final f6a739e4eRpHfepzF:[I

.field public final f7120a747:[I

.field public final f7120a747eVIxGiZj:[I

.field public final f7120a747ZdZBjMcN:[I

.field private f272042c4:J

.field private f272042c4UHHstHQi:J

.field private f272042c4rKtyNLEI:J

.field private f272042c4JGhpihPI:J

.field private f272042c4XQaBkQcJ:J

.field private fb19647fa:J

.field private fb19647fagVRZrTfd:J

.field private fb19647fagTAXNDIJ:J

.field private fb19647faoygHyVwe:J

.field private fb19647faFxtVNOjO:J

.field private f6e636f06:J

.field private f6e636f06HSCUmWWa:J

.field private f6e636f06cHdCcHnE:J

.field private f6e636f06IIzEVBUf:J

.field private f6e636f06WwgOywIO:J

.field private f4191644a:J

.field private f4191644aozDPmABI:J

.field private f4191644aZOZRIqMR:J

.field private f4191644aMzHwihno:J

.field private f4191644aXPHSdoeX:J

.field private fc7382c75:J

.field private fc7382c75YlnocnsP:J

.field private fc7382c75HubEQprU:J

.field private fc7382c75mKcXvgBy:J


# direct methods
.method public constructor <init>(IIIJJ[I)V
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/Cell;-><init>(II)V

    
    iput p3, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f625c771b:I
    nop
    nop

    
    iput-wide p4, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f7395fa6d:J
    nop
    nop
    nop
    nop
    nop

    
    iput-wide p6, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f247df2b4:J
    nop
    nop
    nop
    nop
    nop
    nop

    
    iput-object p8, p0, Lcom/tpcstld/twozerogame/AnimationCell;->fb38b00d9:[I
    nop
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public animationDone()Z
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f7395fa6d:J
    nop
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f247df2b4:J
    nop
    nop
    nop
    nop

    add-long/2addr v0, v2
    nop
    nop
    nop
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f272042c4:J
    nop
    nop
    nop
    nop
    nop

    cmp-long v4, v0, v2
    nop
    nop
    nop
    nop
    nop
    nop

    if-gez v4, :cond_0
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop
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
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getAnimationType()I
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f625c771b:I
    nop
    nop
    nop
    nop
    nop

    return v0
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public getPercentageDone()D
    .locals 4

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f272042c4:J
    nop
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f247df2b4:J
    nop
    nop
    nop
    nop

    sub-long/2addr v0, v2
    nop
    nop

    long-to-double v0, v0
    nop
    nop
    nop
    nop
    nop

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0
    nop
    nop
    nop

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2
    nop
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f7395fa6d:J
    nop
    nop
    nop
    nop
    nop

    long-to-double v2, v2
    nop
    nop
    nop

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v2
    nop
    nop
    nop

    const-wide/16 v2, 0x0
    nop
    nop
    nop
    nop

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0
    nop
    nop
    nop
    nop
    nop
    nop

    return-wide v0
    nop
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public isActive()Z
    .locals 5

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f272042c4:J
    nop
    nop
    nop

    iget-wide v2, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f247df2b4:J
    nop
    nop
    nop
    nop
    nop
    nop

    cmp-long v4, v0, v2
    nop
    nop
    nop

    if-ltz v4, :cond_0
    nop
    nop
    nop
    nop

    const/4 v0, 0x1
    nop
    nop
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop
    nop
    nop

    :cond_0
    const/4 v0, 0x0
    nop
    nop
    nop
    nop
    nop

    :goto_0
    return v0
    nop
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method public tick(J)V
    .locals 2

	goto/32 :after_last_instruction

	:before_first_instruction

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f272042c4:J
    nop
    nop
    nop
    nop

    add-long/2addr v0, p1
    nop
    nop
    nop
    nop
    nop

    iput-wide v0, p0, Lcom/tpcstld/twozerogame/AnimationCell;->f272042c4:J
    nop
    nop
    nop
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction


	:after_last_instruction

	goto/32 :before_first_instruction

.end method
