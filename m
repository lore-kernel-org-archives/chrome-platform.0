Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914C33F377
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747197; cv=none; b=j1OU6umAHcvSnFnj+jMvO+h0YKzwCUKpWqXlsgZNxWuQUOrPnZfIXN3F4c7kWvZi3wvVD5LMkIwuPfgn7OFbpLK97JPzC1TBQaTZnifmsxZeHDmVqoG+ZvdCbLlY5NjpMTcXHIWD5km5/X5eCgLU4Tu32jUZN26w1aznjmdwVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747197; c=relaxed/simple;
	bh=aBbZ3fBywOvpHZwjLuwnPh4cf1hQWBZWB8iOkYD1Dl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBijfaN4eTWbUTV8TEVfxw8OAfS+kh/YoappPPfbYt22W79vowDlF6nOlkGMUKrMhMbzXghZEJ58jaSZZDQ6EFAUVTOGv+WLqWTesB9H/n8Gy8zcP6uChxOcFuXt/8pfGWyLYGuEudZEfiYepFN15wvWR4Im86THkBJm/5ThkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr4T+3eb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e51fmknv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr4T+3eb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e51fmknv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmjaj3136758
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=; b=nr4T+3ebr1GJrOG6
	oJS1QoImgPAnuAAGCrayURKG6BxlosUfnXUwq/PWK6ywxT/K4BzCHSJlmRScuKc1
	YDLEDC5EdgKDgnHIwOhbJ/ypifKbXb2fXrY1kSU4BqI/Xivne2zrKiU09upW9WEk
	hj8gxxcO8lu5OhvwP+/vBktvBJOdsqEsZ2M6GXGhPExJUogJ4BQCPR12z3cHFnqQ
	g+J7fjOh6uDcM3BbxgUZzqyeD5r8JJhyfVR6c5VcNNIFaFuyIrGZF1RpPoBQNJaC
	fxQ/UGt1g+KdbfOt/8gi4RDZ0HrqA1I61U2/o3j42lldLnNas1910ChS8YzrA/K0
	OcGQZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so754412385a.2
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747194; x=1773351994; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=;
        b=e51fmknvUh4yFAZahwocXPLj2OXWCKOD1204w3P+25+L1EZXQ8An5parYtX3YH6Ezb
         CLpzOKfl+425zF+Q8ATx3qSzW8dX03tVTPMu9JLa607Jz32fCZBUeun2FVFTAJcWXwGJ
         Z6aC6MLrpU80+7aOh6EQZQLc7XkaX7AiIRqUwKGn41pDFxEKuRImsKFb3cgVRt0/xFQ0
         gsWO8PE8GhUhIHoR1pU7cNIMyN7SFGcyE9fKyxEI9tLtrOIEaYW4wgDnopOtDEQLDF2d
         D6taTP+yd4CMsCqDSbehyG3qHs9SeeVEW6Lf4PbI5Qb17DaKUowFCLz+X6iIW1pO9k0y
         lKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747194; x=1773351994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=;
        b=XwH7MI4mYXSc1vxmURQfL8gyJ9iPbdKBoo1ijiLH4AX04zzwHRbrPmPfsDTtQQ1vqJ
         XVxPBTTTAzzrE+SNRQIgddY5RWYIEzMtmkhSSk+FcjwEkuZ1ozpANgKfeOa06vyVz2pI
         P+LSCfYjfJQlzRipwGZAalS8AKjebxSREXibhQ7JPdIyWfmkU1v462bjmQ7TPzmfXp0o
         NHMdrKMysEfSfq561HVoIGWs/KVrtJSiFsOTBnRBpzS0eVL2tfqSYPLtEDPuLMySqT8b
         Fz2zZeVN8VQzyaxpO2q0FZddvO1hnbXfOFL7aQ+oE410+Jme+35Ea+gDNAv6o5fG6at3
         2rRA==
X-Forwarded-Encrypted: i=1; AJvYcCVBhTT+/Yf2+DKhioao8nAuHaopGlvwdXzPqzMQuSq5r6o9aOSf9Kwba5d1Yk7GR/2DGXpbwiTFfi0+KM/9ie8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvYMWqdBX6iUnopAJE0cMmKvTB2N9ZKL/CRTihg/TcSADJm4en
	sr4yDGxjEhUq1xp3c5s8ae2cWu06EYuou1takqXAqn1VCcLvIFGbERwFBWnn1Gsl5OdJ6iqI4Mi
	v7UwiPFTcNejNGLvv1rH8hNIxckxEofZfsGfAt4eqGL0IQ9OFiDQ+VuDi0mWKLl2XVcR1lJg=
X-Gm-Gg: ATEYQzxphE+0cbfOdDlHkYnALdVtDOwvDykSNhYxWH9KLDXhubE7B9PgSQRXw4kl9nB
	GztFw9r25rOuqnU49CFXePnLXbuq5Fzk3qmHo7pB03KBUd9fweAItDnxUolgbeaWwjJvKKnhtwo
	3Qxz8oyMhSanPonqHvOpirAKEf6pMiL9XWFsFstSuB8Lhwtbkztv0xNSQfrdjV4V55ajkR2tEeQ
	SPAX23r0IgfmZkkpHyydALXOd6qVuW/edFv5Z9rQZ5TNvY2eHy0wEIABWZ/+jliU8p1147Mx91+
	vRGzi+QnLIJ0MLfbuH0MHvthDxHoOjzn04jHXZs0hqrO1tSZVp5QQp9OBibg/KJvIEx9oBhyh5R
	t8PQc29pNNrn4QlnnkfzY2ZtFoO/+f53wsUlj8mWQ4Aq3
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr6487985a.6.1772747194114;
        Thu, 05 Mar 2026 13:46:34 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr6484285a.6.1772747193616;
        Thu, 05 Mar 2026 13:46:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:47 +0100
Subject: [PATCH v2 08/10] mfd: ezx-pcap: Return directly instead of empty
 gotos
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-8-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aBbZ3fBywOvpHZwjLuwnPh4cf1hQWBZWB8iOkYD1Dl0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmfZyTBQ2+zfg1PVbm//IV3ttzRuDFXfJ09L
 Fi7SOtMm4iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nwAKCRDBN2bmhouD
 13yRD/9atq9XS2gdzOD4iwNE2NzTH/fSxgzEasdtz+9zZKfFoTpfnxFWtJTbN7SumZgig525A5R
 VdZmzIWGbcYZpE3xAn4xsvjLbNB8/GeTpJ1kt8T1rcPPpX94dr5Ht/K5pRdjnVycWFPiKJXtfcA
 iRY5/XOeIZEhXpU7ClLZTrejxnGjsURe8r+u+LlmWrGlfT4VYT4yepmb5E8OIVDUXnlKFEepRKQ
 WYPZ09Oyl21MABeuojbxhRPxzoA/jzjdLe+iCBVzlFihUMfiFrrWvfX872J1GXClSLlGaYFGLeA
 VYOoHJFuO57Q7+4oULKXpzkUTIexLmRp3dGkkprPpzpR0q6+gCsLVeSHJfIl54kgDeKlSJVa4tP
 3tx68crLjDIkHq147LN+7Nlv1yacTQ1Drn3PPXGsOwNHTmOkKt6eoO1tJSU8dItyVB3VdAVUtW5
 YLK5tSgOKhSGndBJaJennrnsayMckl9rhJer7AXlC+sKZ31Ii2uZY9DFB4tGUXtmtDRpX+Nnw1u
 mTECOe4Qt/1YAn962XvbBJjzoZWliJdxuREn2dZiFlamnSKzxS8Tk9zX12OJI6nHFFiZNZESZ3L
 13YIinDTo1FuLh5Fosug3FzrBQlUb6CCIR4714nwcgAQpBhwwMlKDWA4q46CeQ1kxUm2ocxmk0m
 CC5zMWv80d+IrUw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3gh6bfC1KGIa1rSvmhNfxalVBTD8oatY
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3gh6bfC1KGIa1rSvmhNfxalVBTD8oatY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX9vR4iGXcyIJZ
 4/7MpXvFwf4MX/aqjgx+mBUv7XHRfZMbfat7H+FdzqKzYCDAJLIMcv/DlsmGS1LhxRfhHJB4eld
 SrBiTcABVm8TvTg1BmCcAH1kVqYph/OHSp95wMJf9x9d8ziy0G0tVyYmuTCOQwcsq4QGfEY7Snn
 ZvPCsLAvHgjs2DBGF3KbwRT/uYewC5JmpGlgc2eXNKPT55dfnIOFfeujCqu51S40LrH/KImr4Yw
 LGGTcARcNqygtk/c3XflK48gF4jdsQT1L7n8YMJ5ITuVJ17mD2+cAgbTCGjcRhojF8IjbMFwWOB
 3eDG69mP2FQ8UCZ4z6ixl/UGNJ9ZIRveryLYh1QsqGZDnFU4Bx15BiWnxwP958tWS6WxJZYCsul
 o+gIbHNi/UziEGjG8yK9Y/6Mh9LgP9xtTC44Azw8FASs2WiZClswy8lgItwgKqYLOgtpKZ0bBMm
 D2UbEofWmXvaIMsCMkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index cd0520a08224..8e51c113a320 100644
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

