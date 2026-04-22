Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE03932DA
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879812; cv=none; b=dhOvCxWVMlUaZoSll/CP/SKihGnySwA5pZInqhZMsarivRdORj8X0dHGJUduc07eC4/bSr/pvi3gqJMn1z1A0UkEs9QEZdayJv0zL3B+KaiPpEqfw52OgwwrXZ2B+6RR8RLs0j7VV48wVFc4/j1scnutG1hd85UeP7jHMENuvH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879812; c=relaxed/simple;
	bh=j+dZZjvhX3/uWmfqgcfNW8B38xnfwi9TQ/BZm/YnRHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0SOurNMcpsxolHGFgN1br/hcjiT+2jeDIt2UtJkNcef32GGu8nQsQxn6fW9KtRLq6nwNbE4n/NLkrZnsS9ANJjr3lqZEvMGLbZrquSuJ+ouINLCl49r6wWFyRCGDxRBCm+b3CwJ16dwXOOpDtv5qwTmiiun9KvIzxK0EOpv704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpw9HLF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyaTyiHU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpw9HLF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyaTyiHU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFPscG664103
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzXG7s0ro7q
	CMWOD8nEVlnf4H7DSkLvufeY3TSsikco=; b=bpw9HLF5c+cnx3KqIgepiGc/Ugt
	RYsO3AcAmr/xeHdHvtpjc3pcq7KpuxDWzXxaSaL/VQCcSwYcwq5DVDEMvAD9P2Nl
	LRqEWfQo/t77fqiZjGHYLfRdKlN549wg8O/czZwhug0olhqGzwHiu7yG2gDxDWrh
	SC6oLDft6gxf0UXyHKzIeaMarZvawjxPKxvwZ4f+wHrOLuN+GA2FWcifOocl0Bvz
	/tHrISfLO2NY9dttgMzIkREus6/n19E8FZy357AUS5ZEEStPOir1xhT/TSrm3Jrm
	sAs70KMrTp/F0TjX/VYlbj10rIZ+3LlX6xbJRDehT0j2vYEu2zsupEtbJEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsw0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 17:43:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb007bc36so71053511cf.3
        for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879809; x=1777484609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzXG7s0ro7qCMWOD8nEVlnf4H7DSkLvufeY3TSsikco=;
        b=EyaTyiHUIauhN3hSF+JF51mFi5lF1fsPN9prRTS4WlGncpc6P6lQVXAF7zaUCYwuNZ
         ZHawY3A7JKzoa7AbblIQBQ4Twi1K9TomkT31FUqf4zC3uFZowQIRh90qgAvdjvTtE01E
         qOyCDH4zMRETfbbG+XYqtF++OXxMNu0xJqdmwsJnCkxrshCOiU4OE0W1tZWypFbj0AXe
         rQAtygkbfuDoR/gXDjk1jVxjTRUtcPkHtEeDxZZFaUlqF308jpN//rpBMnoyVhH+yC2f
         O+CpJ0kflienxWCmuK9aW9lJcILjqweySXLR01SgW8PTAhfWpC68kMK9NxrJzi0GG/kY
         z/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879809; x=1777484609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzXG7s0ro7qCMWOD8nEVlnf4H7DSkLvufeY3TSsikco=;
        b=IUtr/uANBzKgG/d0a4f8XsC8OlH044CsgE3L1uF9dPSNI5ZoFn1pwskKFS6XnLp9L3
         bkKuU8X1idSKu6q3pTuW6Qk3sEkkEA2cojNKocZRZSHcvmOKQxnV6UVhGhFtrctFZ5iy
         lCCy3pwsqGL/VXk/036/sBK5lC603JRK92+tMhzQH2AkHeHWNbZTgzR/aMMTeeC7kjBA
         4gLSQZ7ffYXZGtC6dH7uDiuXad83iH9VJVj3iHvgZWw83zoweoRHnJxKCAK+yQHxnMsL
         3wcQy1uMHm6VfPNdPescfVY9ZnLcCaFPKLefUr0fJ0RoCqsedHkF0pLtWhyfjWtaHXMy
         FiVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nQt4gpK9TUAG3OEU+mSN9LBOpJcsb93o/QKHoiDEhF1z76XYoo5ZByG6UfqMGFqB6r3407Qvtlgg6R+fsufI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5W/5uN8WHamKXcBa7ziLUuh5d5rn33aZQpgJ6dX9xypiiWXit
	APUQsrXV2qzI3i7CcapKJyXoqdU5jGK7kk7X8na/sb7LU1dGgPYg0w+8d7h68SEYP944Kl4zupQ
	iC7M3jSJuUAmFhrDJ05b4IwvlTvoo+R96G7QlQKclsszpgw7qHdwnUFKBeWJY2Tjv7hZHmU4=
X-Gm-Gg: AeBDieuk9R8KZOzbll2PQzdliVrCgrtWUpke5hLwf/p67epy2fAHo3qMsS3Gz8odGEn
	oCTMTn+r2DqkVCV+VwZcHAFpykQ6Cg4mIVM7IKMB1eqTz/ddqBLhMpJKpRPTEGGuwpJjKh2VMlp
	82NqDFTlks9CPRQ6GBcD3HsZOeKjWb+zJgPVNYvHVoo0zuv1TGq83MDdmjisLy48iJ0vf+uPIN/
	/CPW6agPUQOpw/B2e1/9spY8D9oxV8weUFRNubFdni/59wC45nTHfL2/VOwSht877DQ08sD52w4
	KfxC+rDw8bMw6FfNlyNv6PN3b4flYKGJ+3AhqJzl780afx9sgbTtDPkDRxvOrS3Yxy312eI1zir
	V1IhnqI9kkJ6EL3flTQKKQAJn4KaQNRyNsMFBTarhmWAbUZW9xqkJG2ndXcfI
X-Received: by 2002:a05:622a:5808:b0:50f:c26d:f309 with SMTP id d75a77b69052e-50fc26e288dmr48528601cf.9.1776879809461;
        Wed, 22 Apr 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5808:b0:50f:c26d:f309 with SMTP id d75a77b69052e-50fc26e288dmr48527861cf.9.1776879808984;
        Wed, 22 Apr 2026 10:43:28 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:27 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
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
Subject: [PATCH v2 06/12] hwmon:: Use non-OF thermal cooling device register function
Date: Wed, 22 Apr 2026 19:42:55 +0200
Message-ID: <20260422174305.2899095-7-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jOCJ0bJ8E0IckStUFD3fuarKi7y31Ogt
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e908c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=_jlGtV7tAAAA:8
 a=ggIEzLyBpZPC2L1Vao8A:9 a=dawVfQjAaf238kedN5IG:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: jOCJ0bJ8E0IckStUFD3fuarKi7y31Ogt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX5N6mOs/y1ZFh
 oXfQcNm3mBzDd3Yz10SsfymfUBGlMp5vbaNDZ/2ICZV0beyDicxR2ZUdMG2T9s+XMSSKp3qh0SR
 QlsMJ02nfxK6/4JjJkm/kCT/qcr1CdsDGOPvo80tRHl6pwunHIED3UDUaA5MD2YQvycJ74vkE1s
 MryTueFgcZ4jnOc/kzY49EF/oIzLXwcGE9f8TE19KsJMk52oXKhlRYi5Z/Hb4BDpABtJx25VegQ
 xh0GEwWkcjsZ+Um4H5o+ZPn/fc7gbBmLpfOYmEXc/s5S/DXj9HtwGrAOuFRwxDEgMebKLgRJmoL
 sWO8HCiV1DwxGnz3alK5ADScbRswuzLQ3eW8Lgs0ZxAsisaJyTXZForniur1y6Xqb3ko0VmTkdK
 WuZk1WpA2/2mKjGUIcAyRS0HRPXGzCyzSaL+FniQCwflMHvmEklZCbDghmx4lq3imUbCWMI5XgK
 M/GzgeZ28gN5wiyj07A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

Make HWMON drivers which are not based on device tree to use the
corresponding non-OF functions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
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

