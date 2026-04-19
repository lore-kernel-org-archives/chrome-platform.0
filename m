Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE872ED843
	for <chrome-platform@lists.linux.dev>; Sun, 19 Apr 2026 18:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622974; cv=none; b=dLUF09mEQaJ39ENZafP8qbMKpwQrVZGfRO6KrcZP2M0GQ+m29Vpyf9MSJWCLisItWe2fMLr5DnJFTKY6Xzw+VMCErR81Md9IEZoFftzv2hHki2xTD4dxVBaG52ZK+y/ebETHGoIatjCbbMxggJLY3ln3YeSTFbVZ+TDJ8yER6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622974; c=relaxed/simple;
	bh=x2HKTjy6kA5084gb2G+glaC9oZCPA24Zn7jOFG52TSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFdYJkRjMLBVBT0NfyGsZjtSz7lqZxEEgyTM2aY0cIEMCEFlFPpR2LFY1lJYFv6LIF5CCrfA0HGZva0LAbAOWwmHDzESf/V8CQmOpnqq1YISethKn5Tqqk2DGW5a8MHvxs5a6yrVqkESt/RlQzrzOWuoMhlWRv9EK/CVKzjH26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hz6ymiwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ll8yPG1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hz6ymiwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ll8yPG1d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J3RTG22791518
	for <chrome-platform@lists.linux.dev>; Sun, 19 Apr 2026 18:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ks9AROpzFl6
	d4jF1iHD/p5RckBAUeQlMs5t0zXMHyzk=; b=Hz6ymiwaIWjaYjEIZWjFoeJbzrQ
	LKjE2R7S1XW1/u6l4dPrXPMhbwFl33qYnHPWK4DgqD8ClwFlKweOtPMdbSmSAHAz
	8P4BAvHHwe3BLq6f5MFCNhYYMVTxriEpeaGvwze8FxW5NdCokbb0ns89Bz6mxrCn
	H/RJsK762nGVyud3/F5P4O0sHBv6D05347TLNanP60Fv6s2rEmTSJjB8NZW0X3pe
	kCVZUVFWe4UrOha4++JGGklQQCQM3zbgA53D5JYwnVn2o6Msc2dr/kS0StXeHAoj
	6fX/jinuTmVEmI/IvimiDybLo45dKJ3ai38bbqfxm5RdqpJpYpwgbS4A17g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx31vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Sun, 19 Apr 2026 18:22:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e592e833aso6190481cf.2
        for <chrome-platform@lists.linux.dev>; Sun, 19 Apr 2026 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622965; x=1777227765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks9AROpzFl6d4jF1iHD/p5RckBAUeQlMs5t0zXMHyzk=;
        b=Ll8yPG1dGKD1ZfEFnyb0uEPAVQyuU3Zp1pers0VEfwvJ5F0b2bTMKHEKQWmmUOd6XG
         IydwndgNN1iVusrv2SZrEnHeDuMJE+Dy833Pnr+ae4+43Znd632xuhmb1rkmUFo5QvUp
         nvOgUJmxtT7v6DQEIFjtXr8hkwo5OuZkzf4v+EASWBu8m+audfTl9R8kw+ry6PUQyOl0
         AwY9kd88a8aV617bm4OtcbtiSpRF5NJtg7WCpJo4WJYzC4ZuobNHJpPpashFXIuKYLbj
         FWxbo6cH2FXwMOMLz23J6Ikw/0VOjc8Js8vzgv4wix/bfy2T818zcjDCmpAtHmZcIBuL
         4XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622965; x=1777227765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ks9AROpzFl6d4jF1iHD/p5RckBAUeQlMs5t0zXMHyzk=;
        b=XdxlgzB/MW+2aK+2vvTIYb+WODdXJrBRgVP6RW2bySiK5/h6gzG1ZrDIgdFiUXH8hz
         OKPWZ2S1DDJZNDErp59AIJWrEyzpMPv6OXiS6LoAXhjrqSQPOJeTKFQ3C/n35Oqsvb6I
         Up7ANpYlrSsAt72L7AW5iLXa8DbA81Y91ze6VNWWbx9r+e8hue7XfuuMkcKEVmaL+r3e
         ZQygdwBVW5a2wrAPneUYdHUmN40A/2UwkQm8ZC4VEpymyQMWpOrFINVMD0zJ/xKCe6St
         NJa0U4OZcMpESyVzCBxKVwXoYdr6kqrfconEjGQkUl1NcQytL7sQWvc3EMANEB3i5yZ4
         d5QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GvcCF5Kvq5I5yZ1XVHAL/M9JvrMkyuPt7BJ8fPqUt1LDcai2G0ATv1hNL1L9uvyik0Jkq0VGmr3AjKB/mliY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBj4rIn0/2VHmnhddYodbnE7fdrHynobBXfqEd8LMx1AlKpIrR
	fcKlmQbcEJjVqCJxRfCqL/vdZ+JIxTn8xPlaU/8WfWUMHDlpG24DkghmP6i/mkespHI/cmTHuer
	Un2bQkneyvhehcPpYwL5NnoubRmCdwddyqQbbQqGUozdeXClV6005jNMNbhszX1s0PxxHjrw=
X-Gm-Gg: AeBDiesvlLIPoJrKyY68FFoZ7UEfwLA6DHDTGQtfSDEDMCwnDYPU1DrHEZljUvs47gR
	ly7DC4EZWKQfcS/+cPgZn3XpZgHT0KcwOmKttLTP37uzIGrIDAG6mZ0ngT1NV1glXcMC6RScM0p
	6tisa9hhhdyNTz4Stwtk//f9Rjqkyd8jOameYNeJGcD2lxWnxScelLe0xfKUOri+5Iz1GyyGRAJ
	rXXR2J7UbWBcRWUYvf2XXQma/h4W5jteRXHgVGdOh7XuOtoFu0L+3aTMKODoC5ChmRkZyG+GGd6
	EFBIIeZQ+aKvyTqQ8oBjN+Q7Jtpbn7omQJaj7u2Xr9caRipcJAciHPY9/s6/OsKpt1QghJ+D3At
	JT1LpzBPL0xD0T88ymvlocN9xzP/yZRudxWG3Y2HhxvK2djblFjGBHnv/qw3N
X-Received: by 2002:a05:622a:1820:b0:50b:4a84:aa94 with SMTP id d75a77b69052e-50e36b86249mr168984551cf.7.1776622964776;
        Sun, 19 Apr 2026 11:22:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1820:b0:50b:4a84:aa94 with SMTP id d75a77b69052e-50e36b86249mr168984181cf.7.1776622964258;
        Sun, 19 Apr 2026 11:22:44 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        chrome-platform@lists.linux.dev (open list:CHROMEOS EC HARDWARE MONITORING)
Subject: [PATCH v1 07/14] hwmon:: Use non-OF thermal cooling device register function
Date: Sun, 19 Apr 2026 20:21:51 +0200
Message-ID: <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BDxbwHCwFfKoKNC_mSeolkFKNi7-2xg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX5c4j0giC6RhT
 HYeHMS7NpYmQ/OwlwKx7gRKQqJatzfqDSTVs6YUKZ9Ff5cnTNZRoONozTqLI1bfcwVQ5urZkipd
 f1mLEygJeD9Q5qkr+mYN2x7dPb+ZaXag5Ow7A/G/W/78AN5WvIxrka4lKsVe0ib8RldiCF114Wv
 5eAqY7HvM/QuwU6AWoHn/VIlJRRuJkSVFkF04JYp0b7ponm+rUhWSFp6KZIVZyDlqqy0HHZ5B1a
 zAJBrQkNo0v62eLfGZcxY7DBNaN80o5y+KEp9Pxa1WlHoe2q1She84c6hB9JlndL7+9wdGLTu0G
 mH9JNONld0MSC7tGDFIPIX7vbdYCdAb9PNTSk6AmlXzmPkFc14kdf2PK+AIhQUcYSTSfi4TFZrK
 EZv69UIeOs8mmVUMwoUYEakKiDr11MNMcWYtWOG51IgNZ+hgcW5JJ0LxPuxZ3KSKEm3QJWHuO2N
 I828bkH0eq/IBMWruDg==
X-Proofpoint-GUID: BDxbwHCwFfKoKNC_mSeolkFKNi7-2xg3
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e51d75 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ggIEzLyBpZPC2L1Vao8A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190197

Make HWMON drivers which are not based on device tree to use the
corresponding non-OF functions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/hwmon/cros_ec_hwmon.c  | 4 ++--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 drivers/hwmon/mlxreg-fan.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 6cf5ab0f4b73..77dd9f28962d 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -532,8 +532,8 @@ static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
 
 		cpriv->hwmon_priv = priv;
 		cpriv->index = i;
-		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
-							       &cros_ec_thermal_cooling_ops);
+		cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
+							    &cros_ec_thermal_cooling_ops);
 		if (IS_ERR(cdev)) {
 			dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
 				 cdev);
diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 038edffc1ac7..47b373ea6db4 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1161,8 +1161,8 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
 	if (cdata) {
 		cdata->fan_num = fan_num;
 		cdata->data = data;
-		cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, cdata,
-							       &dell_smm_cooling_ops);
+		cdev = devm_thermal_cooling_device_register(dev, name, cdata,
+							    &dell_smm_cooling_ops);
 		if (IS_ERR(cdev)) {
 			devm_kfree(dev, cdata);
 			ret = PTR_ERR(cdev);
diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 137a90dd2075..860de6cfd8a4 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -583,8 +583,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 		pwm->fan = fan;
 		/* Set minimal PWM speed. */
 		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
-		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
-								    pwm, &mlxreg_fan_cooling_ops);
+		pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
+								 pwm, &mlxreg_fan_cooling_ops);
 		if (IS_ERR(pwm->cdev)) {
 			dev_err(dev, "Failed to register cooling device\n");
 			return PTR_ERR(pwm->cdev);
-- 
2.43.0

