Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D423533DEC2
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976971; cv=none; b=Ogrjr/Ey9PDWTneKTtyRKAhFo+fEjICzaPKaUuj1yO7nLBlS381FR5NU1G2us+s2M2E4FHRjEunikWAhDFiCNa+5aaD+B5NyXCUaEC0Yc8wqdYuUTWiOQZhE62OkIhGHrLzsNf0K548XPpaRHuMKdlmzpHpRwDo8LJGkr0em5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976971; c=relaxed/simple;
	bh=kILhQAgY3kLM16GxFMfnMK5G+NAgnlyKR3dgRK8YfZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HL5+lBNMN8ng9wjGflz5EpsSkvQomX6AoKSXigdzddybhmNxdDb2TeSsORAZs132h2cKQutYoEydz9CftBSRwyef/ytZADn6uQ+snl0QfrisOVQvaEsOQrKMF47OWiyZvFnfA4vmUcxBCKU8yPn6m/w19KfsWcliHU5tg3SuouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+WBRSuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCoZxyy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+WBRSuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCoZxyy6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457CUSf1960770
	for <chrome-platform@lists.linux.dev>; Tue, 5 May 2026 10:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HNlj60pJs02U5K85HJFOtq
	Zd7kl+At2FS1ldDOM8a5U=; b=E+WBRSuHgX8tuxSzKI1QFKFVkIjX265Hi2b9Rk
	qt2ZUpzOxrqWTxNzjWrWv5od9PCeXOFmgSOcyevZ+NDTeysIICCkOxDrmaxwRpkT
	q0KIdSvZ2c68X1ap6eCnC+8YVfvjp0ay4Nc9r85Hvwp5rY7EoE1XeCK4JWuUWRxp
	773SCZVke0K280g13Ok02Qu2zN625zq4NYUqfg8SqmGtq5gxLMpwTeGqN6lzu4ca
	TZhdhJkB4keP1btznh9QYLxyLVhxRN6RvSKn0j7HG0WEyL2zhA9eSbuIB9BijW//
	mJIxj9+kqo7T0mEXVWW52rFcU4AdY/IJWk8laI4k0++DF56g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5duvs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 10:29:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso20483871cf.2
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976968; x=1778581768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=kCoZxyy6M7alop9tIP/5V+bzKjfCaJ//e260rdes2XUDzJp/0AwsZZrJ0BkGYyw+7b
         d4CD+BpNJ1z5qzj/866z5i0TqNaeIBIAY0JV3QLfHE96LTLuQB8W+yzFEZlQTSCWM1uj
         K4UuQp+brxoUSMnuPkTQC+RY1FlBAFpVOZ9Qe9GQDzHLyfubeb6bxleLzayNqPI1kky5
         MWAxjh2hhDlYD5a/Gp6bIGy4bq9213P7CElCTioyA96A2ZOF/UczvvBwTaKBxMst6s4m
         X1rMLM9uT1MpR4FKwMDpskNlFAb3JxQ6VUE72S6pgL80qXsea+Zyk4puX+efsifss7C/
         IkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976968; x=1778581768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=Ch1e9wx13mG8rhqV/Ow8DIm2SAwQWEakg1Z0ZKq1zvsoKZ0X8wPy6LCaW2JhZw7UKQ
         0Dz6A9sjE/kNgCZDTv6dcsDhkHb8Hl1V3MCEiPTZ/T+Q/GKAogWOvY3wRozxd9puBCfG
         thBYni3DSDvTRbsSSeVjXzpEP+n26p5tboj6cWCjMRxwMGZhapi8wqboEII4m4HAm3i4
         QkvSWA3COaPcxOWH0uzypwlRpIFow4tlbryptCUljQXQvwLF2x1W1GcLlxYh0Isbnp4+
         T8Htjtvsu6tBUauwqQ8bwk1D1RgUVLyTNAPS3A8pKX3nqEsSfYeaYd4cqvWdYIAM1x+t
         96jw==
X-Forwarded-Encrypted: i=1; AFNElJ8npK/LpnfqfgmqKjdp4Yeanlk+TE3vmrbS8Fb8wfexfHUBn12+u5y8hnshd+eTa2gkF82bt5qVRdW/fh6Xomk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaNLpHEUDjgImtx5ciO41NRq5nnET/qmED45l5pi7E3OtRZCUm
	yOgqUstV2MoznOTigFPt66r2PC4W3WYP+djzULSugzOF1UXbxXtY/C0DMS28Dw7DOXtyCF1R5bW
	Pt+Ef9zkhrDGA/OyCBF99IyYnudywc7uIMG09MB38wAVGVJvAtAaBKu/k/a+nXaYr2aWDWzE=
X-Gm-Gg: AeBDietvXWzJ4tpQX4KNIGvApIJy6bWULUhiykKSEtc16kKduzKHvHG4ZJyFwbo7y7e
	D4nwuAi6opUDVEHTuOk98P47z8cOWt1Xbx8yMWsdHtkuVgM0pTw7sT73gIqj6Q9mfHhHki5jKY0
	6vcbtSCyBBKfoOGwFyV2D+j3pW+6vlPKBEsKAE2s9vXrYFo3DcU/6yFXkzTq/WkSU5iOGQfmv1q
	fjNMyKhxdCYmw68YyE02ElcfL8uPbygNv9bbitEOmy9aXswOTDNlbnPz9fmm5/bOPd1Qd6YjmmL
	x6OMqZqNmDMu2gamxU2nxURw2tqRRGVx1JzTLoz99XLhXbPwwP+gF3pMZLpBPSy+fG3Dv3RKFPC
	Zi0+AIqqQgYjy6LY7z0pWfyt/LNm838Mors4BwCEngE3C808=
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35476831cf.32.1777976940906;
        Tue, 05 May 2026 03:29:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35472161cf.32.1777976930638;
        Tue, 05 May 2026 03:28:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm307039245e9.10.2026.05.05.03.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:45 +0200
Message-ID: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kILhQAgY3kLM16GxFMfnMK5G+NAgnlyKR3dgRK8YfZk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cZe19spmhey6vI4b/7yFmBq15pM1VGw4Lnc/
 0yugqzzGR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGXgAKCRDBN2bmhouD
 1+IREACFnSRy7ju4VscC9G9J/FnjAyyotS+ISKZWGydzAX1MOB9PooZ37Sf5UDalokelUZojWyx
 +WlYegVlUgcHuj/owKI0xzKKlWPvAiZvZBJF8xpz7fB//0+gOLZTmASdI7KAc5m5baDtLHlCRU3
 yff/QwPa9U7qxINvtbwkiehLmw5d3kX2DBty0i0w1HsYcwsKuy3dEMamsQOyuugpFVUGg0vVnCv
 ElCuozk6ISPxKfqvd45OW/Tkc97bsYI5CcMMwcjJLxX4iQcJ6fKfVWC6rPEgiNlWYwflU8chPGz
 ZmbMxsaWTHZFcs1jiuui6sdmWSzjErhXteLFfaMg2NasVX4D6tnOpzF/Kl365cs1RBwryLXuvob
 WH40NocFZJsHEUelaeXcj6Ac10I2mP3CL8tet14HSRM/8SZEIhwsgvdTA2bTMEmHngqHIGhwvJZ
 nxnMOGPyFkORQDTKppoyrEwt4QCdexA3JMjD5q2kQSQocvIZtO5w9c2tmp0E7VOo8UneY5k16pM
 Iiwuc8ycvpIFz1YByD45DRaYhWEnUGX8Hy+I17MvaP5mTrutYXVLlUGo4r0LyahbdA1HnfIvrfU
 B0/GdY76K0MGfugaaFX6+dWIvth2w1djgET7sYBihXCBz2OC3o7iZ7PkwdhD7iIqMxppz9GjGf/ YrfAMNmEyXD8bVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX+zCk4CAkXhO8
 IR59JwlVWj4HH2HD1qEzkr1VXpXvtBso4+NXuKjWXAuqmiauG053eRf9yk8Xmm80GkAlzQEzrxi
 Y6E2QintCcDZ27z2/vjxHoO213nLcjZtZ20vnYE4PWzjpcmISorRf5PiXfE6Fjs1EdONjtKKReq
 4yNgoqK96IkSkVcl/tvwvQce4QPtuLbfjZ8wou/K3O5BoOUf9mahx3v9updKcyAmYCD27r09woe
 V+W2YNmKPsmk2A0Y/ue/8HhhctrVw74yn7y5V8UslaOljyR9Q5ctKLDeuSw91YAFrtIDx2qcOcU
 OQ+NnHkPb3l6xAkbEj54OKzdgEeOVJ1SK3rMEIlT2rkTtvalUPAMf/w9ce70qIRq0RYPd0K6Gz3
 CHLPX0gB1GcqO97VVjXYaXb+4ZnG11y+zdXHqboz2d4sjTCdmokaTPpd4fg+Lf/YdnF4lfBD9tY
 vGwgrz4EZe3RdYrKu0Q==
X-Proofpoint-GUID: 3DtuqsRZ2ARIEpBWddtR4liuFtgiVYbo
X-Proofpoint-ORIG-GUID: 3DtuqsRZ2ARIEpBWddtR4liuFtgiVYbo
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9c688 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VTue-mJiAAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/leds/blink/leds-bcm63138.c | 2 +-
 drivers/leds/leds-cros_ec.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index ef2e511438cc..45c0662df933 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -296,6 +296,7 @@ static const struct of_device_id bcm63138_leds_of_match_table[] = {
 	{ .compatible = "brcm,bcm63138-leds", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
 
 static struct platform_driver bcm63138_leds_driver = {
 	.probe = bcm63138_leds_probe,
@@ -310,4 +311,3 @@ module_platform_driver(bcm63138_leds_driver);
 MODULE_AUTHOR("Rafał Miłecki");
 MODULE_DESCRIPTION("Broadcom BCM63138 SoC LED driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2..6592ceee866a 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -249,6 +249,7 @@ static const struct platform_device_id cros_ec_led_id[] = {
 	{ "cros-ec-led", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 
 static struct platform_driver cros_ec_led_driver = {
 	.driver.name	= "cros-ec-led",
@@ -257,7 +258,6 @@ static struct platform_driver cros_ec_led_driver = {
 };
 module_platform_driver(cros_ec_led_driver);
 
-MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 MODULE_DESCRIPTION("ChromeOS EC LED Driver");
 MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net");
 MODULE_LICENSE("GPL");
-- 
2.51.0

