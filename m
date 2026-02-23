Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5024634BA53
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831683; cv=none; b=I5Qp2gTGcoNoUDb5rhzKWbY6nhQHtJ4QcgdRx/MYJpDi2hMKqw81QcL1yr7V4CnB2pqoKipAX/PkQ6aFKpJcluGMBWJ5H037xOdI2LDLBgBZFF80T48pLlbJNZdF1ojo3g0eg5QwBbpoxlo98m+E4Fd4c5ydUXtET7EugtE1Vfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831683; c=relaxed/simple;
	bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSY1KTwI/RKLbIyRHSXQ69FxK14TUi9amW6n+1wd7sTpCA61KmURJqFor62NNx3Ntq7/qKy/8/26NP6W03LUWDiDbBT7Jfb7m/tQBNiFkxzGpY0KfwhjT0geobDPrEiOevWlLDF2Yw6zNymxgjPbZw9+enYMeL/NBGEojs49SGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imRR7dQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6W0qv+R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imRR7dQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6W0qv+R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNGMB13093405
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=; b=imRR7dQaLra0EmG/
	CLVgZzMTSjtFjvJGWsatrgZAxI4+8sXNgtBdn1m6ntzrKLeq9IoCDcJaD4E3psOG
	6JiFR1sLUNsl4jhyyPcb2jMWdYLw+O8Gba1KrBolfaV1Mxvk3w136p/s1b+JzTPk
	AU5y09iTzyUYHqPbbUQ2ARe3wymQutpxvg8ec6ZSR6cIjR5XtsDFRnYwDPw4WWF6
	5PwoXLBgw9oEHZYTw3BPH/V0UYAFGm340rZH25TN2XM+1m4fs5jNEDnrv4D7ISBZ
	D17OfkIqZG7l1taNVj1/E6iThifPdwIKFpB3KgEO4A53amQh1OXpdj2h1s2fNJMU
	fhRdHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj3rfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso4350044085a.3
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831679; x=1772436479; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=W6W0qv+RyWgSS8Bv8AEN7ubqKLEvZ9piImcKqZotgfJXskwhDnXJZWJ7zyRbTfHSBd
         8gcLBhwB1ZsSSlsFZt2g+RvyiMK9Uinnyedux7w4LcndZ6DBWsid4JuMs+dwlAs/+Kok
         Jz4W8IVxEuuqrPGHxpWjjniBiMaybzFPWiKU42yZaMfCstMKTokf8lCG6Qh3Bd9po/ZP
         WjfvrXTwsm5FP9KsfiEhGm98cPQo6x+zvN2OtntXd66J+2ckLAgq582XrX6hRK8fy81u
         WCpUQsiMxw0U+Ra8fTU3b2R/oLHIy8eTO5K3UiQStw2kzCpqH83RZ1V80dNFlCojoTtN
         dLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831679; x=1772436479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=JctGALPXmaitwPFpbWfkiy95C9mGf0J4UFf4xUVedDYqG9frHamfdw55IW4u7ADDe7
         86PR3t1mgJEOF3mvVlTpoHRiZKffnbT+ghKy1ZtOgLDgBVSDeOMUiIBVGrSzobv7Akll
         pjP4UCF0J0plUw2LtAejSjOspek73P4lWjlNb8rDhR3ZTgOpJfq0RCtWRjzAvSbIaET/
         a1yGPG2bOAYBLYHx+egGvj85fXK3I8CKYQID0CM/+6UhPH0OLV4DoS2RiYdH50JQPw9b
         zqW/u6jdeAyolqUuSGPbKETd9E3Rt50Nn0VMJWVvVAYpwCfQejQGSpfBvHW7yVh94EYt
         nqjg==
X-Forwarded-Encrypted: i=1; AJvYcCWarF7lflw/lnRezb0p+g+vkO81dcZ9k9VkKTG2sOWLbtkFfFGCKm6SiF8H+bFIPCWtOGKLZi4PQzcebFX2CVc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwrbj0sFSPq5WAkz7znW6C8hVnkxxJPGLFu/1uTZgI07Pk5g7k
	o3Q0MGSj5aklKOVvoF1rRKRbqCdXVBmsraww3l+lsZ1xuR6R3/JYGkAArpjJhgUDl6mLGBNjc2v
	Cw5Xpq933nPcG3DqFwjpg0mGjoEfG8mn6bXwPCvdwBszwfVLgm5Al4gGont+KH2DBsTXiJnI=
X-Gm-Gg: AZuq6aI6adIQCWQGIdvjD9PEOJluGUlOHfPVQ5uV11nXzm61HAKTyUZiT9SITM+QqBU
	FJqWSsiYGE2wkHdpe7kEtJ5nCDWaqW7PXhGXT9ewwH2V1m/jrgScCcQyU3NJFl/GdIaUblxRd0w
	Ukq4UqhMsgeZBHay7RH1LqQuXYlyojH1sxRAE8puRJgFpZcMMx2Bi7W0WSGPPbCNB2J3UhBAW6w
	oLjuJ2x9J/nnvc+47RqVHvGVKLfAq634MnB5H/y92kniC18ulbHEZC/0yIYL8dGSZsysamo7vtn
	mFQDUZUgB/XxV3T9lCsduzH/gINlPAd9Q1Sv/lYypU5lrYGWNsaXTq4ubpiNJXFwsbfOK8I2Nxw
	NSNba5r1fhChOzjkTbo3oELGJRGl7Nk+yVTsijimCLiB02A==
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953887785a.24.1771831678591;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953885685a.24.1771831678191;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:35 +0100
Subject: [PATCH 7/9] mfd: ezx-pcap: Return directly instead of empty gotos
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-7-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFsdVOSZjLWU15fu6tXhkyH5o/JBZijmD+7F
 xJuktpOs16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbAAKCRDBN2bmhouD
 11hqEACQeJWBcnOA0HqzOwEkeI7B9TgL3mN+MiZFvfd+qLHOhNAN5GPqKlAoYXkpu+ggDO0qWz9
 oYB5wpEIyViQz6F7P1BbSk7JDPJNPXtSO8eCIPGH1pBauIFXYzYhV8mSvy5NBR7mEMYSKKu6Ki5
 c2HHxYRYV34xSMpIrhaZh8QRVvQF+02ORACguJKiqALZysCqUV7Lssv6LmOneLzlHwOmppCNJ2o
 TB7ZxS4wPCl6edlbVzZrMMFQ1y+DfwdvIux3JU9oT1PriOQ+M1ocC9uh319Y9tCqJGVUBStU4+p
 SMFlYLPr0BTBAPNFFombh5ZS68gj4DqMJ6Unb/ZrUU/4jkXJNA681W6H59pOUOXo8QIziJ7gdHL
 yLif6Cex6xL/Ap+5oN2poWDdGsdcuj15yxkdz5lyJyRdBSslo4p7EGLMPzdeqY79LEwoqKafjAa
 vU3CpssLcVilmqPFQ3SZBwFW06aflTmZkGUbBUB/mUUo7I8VTS3SdhS635sblTp41z5mhW/xy0r
 vvKapnIZlD9rOw5Xxg19beyLy37OW1z/5cm0mAYucel1XB/13lDUq0v86dixoHMc1KA1qdQC67y
 qsmaAQwI4e7mlF47O+yr/jaCE6/Z8x6wiysP1jZxhoPdIGKyBILkDL/5cNMwz7/FT78JNlj7SK0
 pLo5wqw2dA4WDpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX9tKzuUcB66i/
 +V0IPlF06Ayh9SLQ6GMiotFH47qoJe06D9bDojNUwJfNLxf4uQaprk4gFgVU+L4VQsjeJWXltly
 BOFISC6yzTShAmQ2+WDeMu3tRj+9wMVA6Su65QFL7i+qeJmnsY6IdmKoMjvmWDGj+BAEgr1nsts
 kR9vHaMUhnDDil4JcJ4YObjzzkdeZ86uQ2su92fWog6zDruf1NE3nuGnZLjfwlbU9ijEN2/xdPn
 WLpC8hQ1EBIoPx03kqymN+13S5ZppzhCvPBHO5VROhV3yEOozPO9Um5cBOjX74yVv2ERsE4nwR9
 PhVSamRlOhep9JoeRYBB4yTObhDF74+wo+RoRoa5xZxNGYsvnSTPMx7g+s1hqXcNCtup326nURf
 9AWktGJr3SMwws2YHavKEAejVcBq2ZVo54JodrUZUyBBYnljZIzXALVK+B1YteG/49AcY1Jl+zt
 d2E+qf+e7U7Q4aFJX/w==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c017f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xcQXTuttS0d6zgQFIlxIt4ha7hOr--2k
X-Proofpoint-ORIG-GUID: xcQXTuttS0d6zgQFIlxIt4ha7hOr--2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 13cb185638a9..b929559d84ae 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -384,17 +384,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct pcap_chip *pcap;
 	int i, adc_irq;
-	int ret = -ENODEV;
+	int ret;
 
 	/* platform data is required */
 	if (!pdata)
-		goto ret;
+		return -ENODEV;
 
 	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap)
+		return -ENOMEM;
 
 	spin_lock_init(&pcap->io_lock);
 	spin_lock_init(&pcap->adc_lock);
@@ -407,17 +405,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
 	ret = spi_setup(spi);
 	if (ret)
-		goto ret;
+		return ret;
 
 	pcap->spi = spi;
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
-	if (!pcap->workqueue) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap->workqueue)
+		return -ENOMEM;
 
 	/* redirect interrupts to AP, except adcdone2 */
 	if (!(pdata->config & PCAP_SECOND_PORT))

-- 
2.51.0

