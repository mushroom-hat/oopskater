.class Lcom/tpcstld/twozerogame/InputListener;
.super Ljava/lang/Object;
.source "InputListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final f7f70966f:I = 0xfa

.field private static final f7f70966fZHOOstJb:I = 0xfa

.field private static final fa33b041f:I = 0xa

.field private static final fa33b041fNUAMNbEn:I = 0xa

.field private static final fef1e60ea:I = 0x0

.field private static final fef1e60eacdqldqPA:I = 0x0

.field private static final fa6e8b11e:I = 0x19

.field private static final fa6e8b11eaKwCmhUR:I = 0x19

.field private static final fa6e8b11elDhvDIwd:I = 0x19


# instance fields
.field private fb587fade:Z

.field private fb587fadebtkyJHgn:Z

.field private fb587fadeqpxlSLtv:Z

.field private f3975be87:Z

.field private f3975be87kYCXBTHW:Z

.field private f4c93db25:F

.field private f4c93db25pPzNLaNx:F

.field private fe0fa2347:F

.field private fe0fa2347WFCwbRbs:F

.field private final f7d6c7318:Lcom/tpcstld/twozerogame/MainView;

.field private final f7d6c7318bnlSkfjR:Lcom/tpcstld/twozerogame/MainView;

.field private f47e13400:I

.field private f47e13400VTHYzasP:I

.field private f29bd33b7:F

.field private f29bd33b7ywiioaMt:F

.field private f29bd33b7aeoAKunh:F

.field private f29bd33b7ENAiupVB:F

.field private f29bd33b7YrHkUkKw:F

.field private f1331cc69:F

.field private f1331cc69zhOVoBij:F

.field private f1331cc69gzplzKJR:F

.field private f01412ace:F

.field private f01412acegBQVFMDY:F

.field private f01412aceKFjimJSO:F

.field private f01412acemNTMNOyQ:F

.field private fe51824ac:F

.field private fe51824aceOQmCwua:F

.field private f6dfae740:I

.field private f6dfae740UqyqGRub:I

.field private f6dfae740RkGkoCdF:I

.field private f6dfae740dlOyXqvG:I

.field private f9dd4e461:F

.field private f9dd4e461xPHfzuHJ:F

.field private f9dd4e461XHpTBPzm:F

.field private f9dd4e461zsWRaSgz:F

.field private f9dd4e461JZZuGEgI:F

.field private f41529076:F

.field private f41529076BdEsEroC:F

.field private f41529076PApBKqUR:F


# direct methods
.method public constructor <init>(Lcom/tpcstld/twozerogame/MainView;)V
    .locals 1

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1
    nop
    nop
    nop

    
    iput v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop
    nop

    
    iput v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop

    const/4 v0, 0x0
    nop
    nop
    nop

    
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f3975be87:Z
    nop
    nop
    nop

    
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->fb587fade:Z
    nop
    nop
    nop

    
    iput-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    return-void

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method static synthetic access$000(Lcom/tpcstld/twozerogame/InputListener;)Lcom/tpcstld/twozerogame/MainView;
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget-object p0, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    return-object p0
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private iconPressed(II)Z
    .locals 4

	goto/32 :after_last_instruction

	:before_first_instruction

    const/4 v0, 0x1
    nop

    
    invoke-direct {p0, v0}, Lcom/tpcstld/twozerogame/InputListener;->isTap(I)Z

    move-result v1
    nop

    if-eqz v1, :cond_0
    nop
    nop
    nop

    int-to-float v1, p1
    nop
    nop

    iget v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    iget-object v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget v3, v3, Lcom/tpcstld/twozerogame/MainView;->ff5e10c45:I
    nop
    nop
    nop

    add-int/2addr p1, v3
    nop
    nop

    int-to-float p1, p1
    nop

    invoke-direct {p0, v1, v2, p1}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1
    nop

    if-eqz p1, :cond_0
    nop
    nop
    nop

    int-to-float p1, p2
    nop
    nop
    nop

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop

    iget-object v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget v2, v2, Lcom/tpcstld/twozerogame/MainView;->ff5e10c45:I
    nop
    nop

    add-int/2addr p2, v2
    nop

    int-to-float p2, p2
    nop

    
    invoke-direct {p0, p1, v1, p2}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1
    nop
    nop

    if-eqz p1, :cond_0
    nop
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

.method private inRange(FFF)Z
    .locals 0

	goto/32 :after_last_instruction

	:before_first_instruction

    cmpg-float p1, p1, p2
    nop

    if-gtz p1, :cond_0
    nop
    nop
    nop

    cmpg-float p1, p2, p3
    nop
    nop

    if-gtz p1, :cond_0
    nop
    nop

    const/4 p1, 0x1
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_0
    const/4 p1, 0x0
    nop

    :goto_0
    return p1
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private isTap(I)Z
    .locals 3

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/InputListener;->pathMoved()F

    move-result v0
    nop
    nop
    nop

    iget-object v1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget v1, v1, Lcom/tpcstld/twozerogame/MainView;->ff5e10c45:I
    nop

    iget-object v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget v2, v2, Lcom/tpcstld/twozerogame/MainView;->ff5e10c45:I
    nop
    nop

    mul-int v1, v1, v2
    nop
    nop

    mul-int v1, v1, p1
    nop
    nop

    int-to-float p1, v1
    nop
    nop
    nop

    cmpg-float p1, v0, p1
    nop
    nop
    nop

    if-gtz p1, :cond_0
    nop

    const/4 p1, 0x1
    nop
    nop
    nop

    goto :goto_0
    nop
    nop
    nop

    :cond_0
    const/4 p1, 0x0
    nop
    nop

    :goto_0
    return p1
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method

.method private pathMoved()F
    .locals 4

	goto/32 :after_last_instruction

	:before_first_instruction

    
    iget v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop
    nop
    nop

    sub-float v2, v0, v1
    nop
    nop
    nop

    sub-float/2addr v0, v1
    nop
    nop

    mul-float v2, v2, v0
    nop
    nop
    nop

    iget v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iget v1, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop

    sub-float v3, v0, v1
    nop
    nop

    sub-float/2addr v0, v1
    nop

    mul-float v3, v3, v0
    nop

    add-float/2addr v2, v3
    nop
    nop

    return v2
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10

	goto/32 :after_last_instruction

	:before_first_instruction

    
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1
    nop
    nop

    const/4 v0, 0x0
    nop

    const/4 v1, 0x0
    nop
    nop
    nop

    const/4 v2, 0x1
    nop

    if-eqz p1, :cond_17
    nop

    const/4 v3, 0x2
    nop
    nop
    nop

    if-eq p1, v2, :cond_12
    nop
    nop

    if-eq p1, v3, :cond_0
    nop
    nop

    goto/16 :goto_4
    nop

    
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->isActive()Z

    move-result p1
    nop

    if-eqz p1, :cond_11
    nop
    nop

    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/InputListener;->fb587fade:Z
    nop
    nop

    if-nez p1, :cond_11
    nop
    nop
    nop

    
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop
    nop

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f29bd33b7:F
    nop
    nop
    nop

    sub-float/2addr p1, p2
    nop

    
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop

    add-float/2addr p2, p1
    nop

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2
    nop
    nop

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop
    nop

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4
    nop
    nop

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v5
    nop

    add-float/2addr v4, v5
    nop
    nop
    nop

    const/high16 v5, 0x41200000    # 10.0f
    nop
    nop
    nop

    cmpg-float p2, p2, v4
    nop
    nop

    if-gez p2, :cond_1
    nop
    nop

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p2
    nop
    nop

    cmpl-float p2, p2, v5
    nop
    nop

    if-lez p2, :cond_1
    nop
    nop
    nop

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop
    nop

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop

    sub-float/2addr p2, v4
    nop
    nop
    nop

    
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2
    nop

    cmpl-float p2, p2, v1
    nop
    nop
    nop

    if-lez p2, :cond_1
    nop

    
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop
    nop
    nop

    
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop
    nop

    
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop
    nop

    
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop
    nop

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop
    nop

    
    :cond_1
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop
    nop
    nop

    cmpl-float p2, p2, v1
    nop
    nop
    nop

    if-nez p2, :cond_2
    nop
    nop
    nop

    
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop

    
    :cond_2
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f1331cc69:F
    nop

    sub-float/2addr p2, v4
    nop

    
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop
    nop
    nop

    add-float/2addr v4, p2
    nop
    nop
    nop

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4
    nop
    nop
    nop

    iget v6, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop
    nop
    nop

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6
    nop

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v7
    nop

    add-float/2addr v6, v7
    nop
    nop
    nop

    cmpg-float v4, v4, v6
    nop

    if-gez v4, :cond_3
    nop

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4
    nop
    nop

    cmpl-float v4, v4, v5
    nop
    nop
    nop

    if-lez v4, :cond_3
    nop
    nop

    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop

    iget v5, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop

    sub-float/2addr v4, v5
    nop
    nop
    nop

    
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4
    nop
    nop

    cmpl-float v4, v4, v1
    nop

    if-lez v4, :cond_3
    nop
    nop

    
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop
    nop

    
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop
    nop

    
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop
    nop

    iput v4, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop

    
    :cond_3
    iget v4, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop
    nop
    nop

    cmpl-float v4, v4, v1
    nop
    nop
    nop

    if-nez v4, :cond_4
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop

    
    :cond_4
    invoke-direct {p0}, Lcom/tpcstld/twozerogame/InputListener;->pathMoved()F

    move-result v4
    nop
    nop
    nop

    cmpl-float v1, v4, v1
    nop

    if-lez v1, :cond_11
    nop
    nop
    nop

    iget-boolean v1, p0, Lcom/tpcstld/twozerogame/InputListener;->f3975be87:Z
    nop

    if-nez v1, :cond_11
    nop
    nop
    nop

    const/high16 v1, -0x3c860000    # -250.0f
    nop
    nop
    nop

    const/high16 v4, -0x3e380000    # -25.0f
    nop
    nop
    nop

    const/high16 v5, 0x437a0000    # 250.0f
    nop
    nop
    nop

    const/high16 v6, 0x41c80000    # 25.0f
    nop

    const/4 v7, 0x3
    nop
    nop

    cmpl-float v8, p2, v6
    nop
    nop
    nop

    if-ltz v8, :cond_5
    nop
    nop
    nop

    
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v8
    nop

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v9
    nop
    nop
    nop

    cmpl-float v8, v8, v9
    nop

    if-gez v8, :cond_6
    nop

    :cond_5
    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iget v9, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop

    sub-float/2addr v8, v9
    nop

    cmpl-float v8, v8, v5
    nop
    nop

    if-ltz v8, :cond_7
    nop
    nop
    nop

    :cond_6
    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop

    rem-int/lit8 v9, v8, 0x2
    nop
    nop
    nop

    if-eqz v9, :cond_7
    nop
    nop

    mul-int/lit8 v8, v8, 0x2
    nop
    nop

    
    iput v8, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop
    nop

    
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop

    
    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget-object v0, v0, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {v0, v3}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    :goto_0
    const/4 v0, 0x1
    nop
    nop
    nop

    goto :goto_1
    nop
    nop

    :cond_7
    cmpg-float v3, p2, v4
    nop
    nop

    if-gtz v3, :cond_8
    nop
    nop

    
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v3
    nop
    nop

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v8
    nop
    nop
    nop

    cmpl-float v3, v3, v8
    nop
    nop

    if-gez v3, :cond_9
    nop

    :cond_8
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop

    iget v8, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop

    sub-float/2addr v3, v8
    nop

    cmpg-float v3, v3, v1
    nop
    nop
    nop

    if-gtz v3, :cond_a
    nop

    :cond_9
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop

    rem-int/lit8 v8, v3, 0x3
    nop
    nop

    if-eqz v8, :cond_a
    nop
    nop

    mul-int/lit8 v3, v3, 0x3
    nop
    nop

    
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop

    
    iput v7, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop

    
    iget-object v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget-object v3, v3, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {v3, v0}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    goto :goto_0
    nop
    nop

    :cond_a
    :goto_1
    cmpl-float v3, p1, v6
    nop
    nop
    nop

    if-ltz v3, :cond_b
    nop
    nop

    
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v3
    nop
    nop

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v6
    nop
    nop
    nop

    cmpl-float v3, v3, v6
    nop
    nop
    nop

    if-gez v3, :cond_c
    nop

    :cond_b
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop

    iget v6, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop
    nop

    sub-float/2addr v3, v6
    nop
    nop
    nop

    cmpl-float v3, v3, v5
    nop
    nop

    if-ltz v3, :cond_d
    nop

    :cond_c
    iget v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop

    rem-int/lit8 v5, v3, 0x5
    nop

    if-eqz v5, :cond_d
    nop
    nop

    const/4 p1, 0x5
    nop
    nop
    nop

    mul-int/lit8 v3, v3, 0x5
    nop

    
    iput v3, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop

    
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop
    nop

    invoke-virtual {p1, v2}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    :goto_2
    const/4 v0, 0x1
    nop

    goto :goto_3
    nop
    nop

    :cond_d
    cmpg-float v3, p1, v4
    nop
    nop
    nop

    if-gtz v3, :cond_e
    nop
    nop

    
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1
    nop

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2
    nop

    cmpl-float p1, p1, p2
    nop
    nop

    if-gez p1, :cond_f
    nop

    :cond_e
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop
    nop

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop
    nop

    sub-float/2addr p1, p2
    nop
    nop
    nop

    cmpg-float p1, p1, v1
    nop
    nop
    nop

    if-gtz p1, :cond_10
    nop
    nop

    :cond_f
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop

    rem-int/lit8 p2, p1, 0x7
    nop
    nop

    if-eqz p2, :cond_10
    nop
    nop

    const/4 p2, 0x7
    nop
    nop
    nop

    mul-int/lit8 p1, p1, 0x7
    nop
    nop

    
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {p1, v7}, Lcom/tpcstld/twozerogame/MainGame;->move(I)V

    goto :goto_2
    nop
    nop
    nop

    :cond_10
    :goto_3
    if-eqz v0, :cond_11
    nop
    nop

    
    iput-boolean v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f3975be87:Z
    nop
    nop
    nop

    
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop

    
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop

    
    :cond_11
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f29bd33b7:F
    nop
    nop
    nop

    
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f1331cc69:F
    nop

    return v2
    nop
    nop

    
    :cond_12
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    
    iput v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f47e13400:I
    nop
    nop
    nop

    
    iput v2, p0, Lcom/tpcstld/twozerogame/InputListener;->f6dfae740:I
    nop
    nop

    
    iget-boolean p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f3975be87:Z
    nop
    nop

    if-nez p1, :cond_16
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->f6e727e21:I
    nop

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->f8e32e5cf:I
    nop
    nop

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1
    nop
    nop

    if-eqz p1, :cond_14
    nop
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->gameLost()Z

    move-result p1
    nop

    if-nez p1, :cond_13
    nop

    
    new-instance p1, Landroid/app/AlertDialog$Builder;
    nop
    nop
    nop

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    invoke-virtual {p2}, Lcom/tpcstld/twozerogame/MainView;->getContext()Landroid/content/Context;

    move-result-object p2
    nop

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->f86266ee9:I
    nop
    nop

    new-instance v0, Lcom/tpcstld/twozerogame/InputListener$1;
    nop
    nop
    nop

    invoke-direct {v0, p0}, Lcom/tpcstld/twozerogame/InputListener$1;-><init>(Lcom/tpcstld/twozerogame/InputListener;)V

    
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1
    nop
    nop
    nop

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->fda488d18:I
    nop
    nop

    const/4 v0, 0x0
    nop
    nop
    nop

    
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1
    nop
    nop
    nop

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->f1cab3b37:I
    nop

    
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1
    nop
    nop

    sget p2, Lcom/tpcstld/twozerogame/base/R$string;->fbc664b39:I
    nop

    
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1
    nop
    nop
    nop

    
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_4
    nop
    nop
    nop

    
    :cond_13
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->newGame()V

    goto :goto_4
    nop

    
    :cond_14
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->fb1f2b9f1:I
    nop
    nop
    nop

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->f8e32e5cf:I
    nop
    nop

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1
    nop
    nop
    nop

    if-eqz p1, :cond_15
    nop
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->revertUndoState()V

    goto :goto_4
    nop

    
    :cond_15
    invoke-direct {p0, v3}, Lcom/tpcstld/twozerogame/InputListener;->isTap(I)Z

    move-result p1
    nop

    if-eqz p1, :cond_16
    nop
    nop

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->f01412ace:I
    nop
    nop
    nop

    int-to-float p1, p1
    nop
    nop
    nop

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget v0, v0, Lcom/tpcstld/twozerogame/MainView;->fb0efee4b:I
    nop

    int-to-float v0, v0
    nop
    nop
    nop

    invoke-direct {p0, p1, p2, v0}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1
    nop

    if-eqz p1, :cond_16
    nop
    nop

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->fe51824ac:I
    nop

    int-to-float p1, p1
    nop
    nop
    nop

    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop

    iget-object v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop

    iget v0, v0, Lcom/tpcstld/twozerogame/MainView;->fea34008c:I
    nop

    int-to-float v0, v0
    nop
    nop
    nop

    
    invoke-direct {p0, p1, p2, v0}, Lcom/tpcstld/twozerogame/InputListener;->inRange(FFF)Z

    move-result p1
    nop

    if-eqz p1, :cond_16
    nop
    nop
    nop

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget-boolean p1, p1, Lcom/tpcstld/twozerogame/MainView;->fa8070ffd:Z
    nop
    nop

    if-eqz p1, :cond_16
    nop
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget-object p1, p1, Lcom/tpcstld/twozerogame/MainView;->fc8d46d34:Lcom/tpcstld/twozerogame/MainGame;
    nop
    nop

    invoke-virtual {p1}, Lcom/tpcstld/twozerogame/MainGame;->setEndlessMode()V

    :cond_16
    :goto_4
    return v2
    nop
    nop

    
    :cond_17
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1
    nop
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop

    
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    
    iget p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f9dd4e461:F
    nop
    nop

    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f01412ace:F
    nop

    
    iget p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f41529076:F
    nop
    nop
    nop

    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->fe51824ac:F
    nop
    nop

    
    iput p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f29bd33b7:F
    nop

    
    iput p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f1331cc69:F
    nop
    nop
    nop

    
    iput v1, p0, Lcom/tpcstld/twozerogame/InputListener;->f4c93db25:F
    nop
    nop
    nop

    
    iput v1, p0, Lcom/tpcstld/twozerogame/InputListener;->fe0fa2347:F
    nop
    nop
    nop

    
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->f3975be87:Z
    nop
    nop

    
    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->f6e727e21:I
    nop
    nop

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop
    nop

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->f8e32e5cf:I
    nop
    nop
    nop

    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1
    nop
    nop
    nop

    if-nez p1, :cond_18
    nop
    nop

    iget-object p1, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget p1, p1, Lcom/tpcstld/twozerogame/MainView;->fb1f2b9f1:I
    nop
    nop

    iget-object p2, p0, Lcom/tpcstld/twozerogame/InputListener;->f7d6c7318:Lcom/tpcstld/twozerogame/MainView;
    nop
    nop

    iget p2, p2, Lcom/tpcstld/twozerogame/MainView;->f8e32e5cf:I
    nop
    nop

    
    invoke-direct {p0, p1, p2}, Lcom/tpcstld/twozerogame/InputListener;->iconPressed(II)Z

    move-result p1
    nop
    nop
    nop

    if-eqz p1, :cond_19
    nop
    nop
    nop

    :cond_18
    const/4 v0, 0x1
    nop

    :cond_19
    iput-boolean v0, p0, Lcom/tpcstld/twozerogame/InputListener;->fb587fade:Z
    nop
    nop

    return v2
    nop
    nop
    nop

	:after_last_instruction

	goto/32 :before_first_instruction

.end method
