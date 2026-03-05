Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41935F606
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747201; cv=none; b=VpPneUOhjRN/d/nmbkvPZLcjv1e3DX3rc+FbBAygVmqKYu1FV7idT4jlfUutFILKCSB11fqUsKGAG0tw9LvTaQnf6a0vCB4GfmhdazPEFwcJda0ZRNcmlDxfLf/wIpEazyZJUAKVAjNoZwUWvYUt/aDgh+07R5Ivbx8P54eyfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747201; c=relaxed/simple;
	bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=euE4TXquPkl0n86/gtrAxngotG96qBdfx24LGxqRkwcCrtpkl8emtQ5wOm+QRBI3PobWn1yx8i9TsTWPR+nIGX9O5LFr+kn1JyxiTtE5yiMfQBYfGezexZLBT72npoioICRAtunQv8HONBhECyqprOVJcA9jO2uKpKIgr/NRTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTDsn66d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPj9HUAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTDsn66d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPj9HUAm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmj0r1489174
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=kTDsn66dim843s3x
	bzoXPIj8EMMuopwYjRQyxsAK0/F0JrLLNjwqqwjHiYKYbhwfPNhqEV4WSOKJTCUw
	8oRKJBIWpwqKxNHZ57CpnugwbQWqPa5aSY2ouGRwOTL8lVMY7JpN/Y+1wNYXwsZk
	q/ZtWA4mj04NpXSgvJwO18yHZexy5y1y+Tj+Fzp0aTNXH93IRWMLAetDFFsYR4U2
	Hpbx66OeSEqYiZt20rz+ClqHIZThDHpoZ3Ovg9QCfci4I6W4FyKD5qPoLWMoyLGk
	x0hL5k9uvxjBs8nNVHiSI8VkubHB0rMzXHqth4SYLMXk9Lp7OmDgRmKB3vX5TH+e
	YzxRLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wa40b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso1088312485a.3
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747198; x=1773351998; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=RPj9HUAm0wb1foOuvczD07QLgM3bgE4WTnYID1NsCWzuk0ogWzjj1Av8XgMLrivSSM
         KCl9suxKwsbS/a9gR1GPcmvpxlo0fieyBIo+Qi+nIRq1N0Ckap0qb6yZF46JX+VrPmRE
         TibEXVS2w6gJmSr3/1hKeRpQXnf/FEzbLaZf6crQbb6p9hBTHeEZ0IqnnGTI0FUCMUcu
         e7AHk6Wt1E2n5rBVKpZ+tKpUDyOL3+K2FfTDway/pkBdUuSEvPSi8jvG9bGLsIm35xDg
         88wQK3U5r+msHrAPOa2wdFCYx7Uf7wjonrgNZfGmZRuccWBUfjIpNXPelD6Rv6nT7Jbq
         bXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747198; x=1773351998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=lCfTHDNVYnYBBPwJbuXfVjqHOQnO4lEiHRjAtxzNnXcMZIze+4F/t3nMXBXrMP4ybK
         bVGsa1QUZo9x1KWnFZhWbfwD7wMEULetRtCWLm6WJeomR4vPSBGyAnRw/bJavicRIhkB
         gWJ8Ti5EZoUql8qWSY0ArsNGyEOwj7O/WbcYLRKnROSpCAqHNuYXMxogz6V7t2Z3Igmf
         satZWmOBymZTBNSKlHAdyAyDiyt/HLEGUK3Ug0/jiKVMxisWUphHYzuumJQnstJwb8hw
         SClQ2q09p3xk7hSZOwNFtkYIJ2/GIoQAxVucNT5evDPkSqVwHomoZoPucm+6KkKuoxhq
         NmxA==
X-Forwarded-Encrypted: i=1; AJvYcCV68zFoDuag22bpvk6jYMHvurhqKY+Rl/J2sLs4Ne51biwuxdHAZX6+4i82JxnnsOrqWa+lLbG91lOHDADxYII=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe0CSd+Rbw696EHrkYwVOEssDJYDftv22PRDOFU2/Pn/1jiTn4
	3ywdjcbOrjD/PLRDcDqeK6neU+WszmpV1SrsF5G26FVjb7q1I4XAKXLxBJcTJYKMXHv+Bqk8aSb
	hApjPKiiqM5kmlFaKpwtTWW7n2/3+yrLmO+9cNe3/bZI3elCPPEjnFmZ76GO6ruJc/n82HHk=
X-Gm-Gg: ATEYQzwS3cwPZRj2BNFME81YG7MAGVOlpgjwRKFhYZZPd7gqPTBuJUAKMD5VC9WpnJ9
	SxNfddUhvp6sH+8xze/n5xQ+hkv5M4r/hu1k/x5Dp74mGlCJ6dA9dSobQ46xpLrI+veuCoLPUs6
	BhMiRVucF4ww9oDP6dXxmppry16ezsbHYFoTCi9ZGdSNk6NJOxut1K73PsIndXf8ANfxLjRSuEn
	LhAScoBa9D1xsc5iQIV6x41/ipJmkjyMtQRiyYwuLyzSMduNfdylszTkGZQT324M0TrBPuYrrti
	rJ5A9Vft4yyOksR+7H4OA2IPYoEEhVAGrqJB2EB1/0Y3T1LP0zyuYFG42eS1LzgrgA6GQnjGbfw
	k0rYTbN8Wez2N7uNAe7BboL3ljOvXqguX2Edezgqngi7B
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1698085a.42.1772747197580;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1693585a.42.1772747197119;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:48 +0100
Subject: [PATCH v2 09/10] mfd: ezx-pcap: Avoid rescheduling after
 destroying workqueue
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-9-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmgTLUiHh6rin6gIR8tn/yHPbJ7keLcVF5yZ
 GGBAe1ny7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oAAKCRDBN2bmhouD
 1+A1D/46IEOXU4c7rCB302yiUbZqrN3J0Box+FRnliJ/p6E8EXiDnmOg4obwzDlEUpFEf7ibEyq
 GYEw9cFAKDrszgDdGRbIFVYHr8RFOirL2Hdrl9Km81dPKqBQLXZQWnvAIKZe4uFGm8rDEiTS3FV
 gXubYix78Obr5LtZTm+Tn3H4VlOmRf/a1n/SAYakf/wp8btHWAgUY7J9nNAMK2Lbwsc4nzYJoHi
 vZbjtyC/9Gclm/CRe1O8vCpyJktvnNgAqHtQ/jojtr4XybHQF965vKIWwvLvoJBrhi2yylmf/EG
 S8CxeogMKobJs6UveopZ0d5TANJ1DRYacznxvzG9KA6g6X2xQKhxgYl480SHuTQMwdI5ygPt58U
 YlxL6+Ij5kO4Fz14qrhXHTZ40edvx0sQflZMFPcB4RVEyHUSnt2upCd3xRWA+BtmXbJ3NVnN7YE
 7JHqzNSdItYNG4lO1wHyEOQRHGJ6KLMq+xqetuC7XXGt+e2iAroOx4ODQ1itWBm9mnLq0brsQkX
 aZkgptRJCcNG6nj6JfVtXI5u3cZGNevrxo+gGHIhTsR2iQROE0tCQbAzduBnKIEtq3Pm4AyCrGB
 GzbjoRK4ad8uW8GvCPBi00G3EXVvoOWPBuOLeQPVp8BuTwkTHYs7DVw1wsrnE0aEKQYge+pTQo1
 a1ws7+4oKjEY6DQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: EBxDHVmoz9kPkXeX_oplmQPc2F9QZQBa
X-Proofpoint-GUID: EBxDHVmoz9kPkXeX_oplmQPc2F9QZQBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX/k5hEwpEL9Ap
 IulNfV8PXFiPErwYKx0FUD+09RaCP7Lflcu3xIoBfoBbJI6yxm4UkiDWInDNKydWKFZU0YAb01t
 8JhX983AbsAa953iru5J1nTXAqaKeIeVMK8msrR/zUPpwsUdu44VUp5TAsJsLTyvZfyWYZjEVcO
 hyvwzjgLX129cSk0b0hBLII3GrQihyNlfSxUZUtM1v1jeUZMycvpC7F4MZ2eazuzvPWTDLKqhra
 xe0KsbOCylGbw5x384U9igahZHhHdTILz0kJwMtBQEeuxLOq09tdYWPd8oBT5ty/21nG2vX33fB
 mA1zzt4zxden7Gftj/UnSc44T4mSv7+BKikgak3VYIHIGv2IO78B1J3Cx0ub/Ir4dPF/ZiZ34C2
 1zNTg+F145TKT6tovh4VOrNPe69eUR0ampjazv9ibwkWWkSWPZ/ijf9lJdsa8d8G3w3qj9PPqVK
 Utc+kbjTxrvmerjWRdQ==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9f9be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3MYFky5D01qQmCoSdzEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update device registers, thus there is no point to run it for
memory reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 8e51c113a320..9a685ff8cd15 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0

