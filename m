Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85833FCB05
	for <chrome-platform@lists.linux.dev>; Tue, 26 May 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804530; cv=none; b=p64GpqEcTFnKVHGpfufe+kG8O0+du4G4FcGgutxPGIiJNMg7DrnXEjMWOt03i/yKyNPB2g831VLk//a0HToTZXB/ww3vm4HmMTmH73MJ6w+PFRGYBVlih3H8Ly1qojzAM6ewuecn12UNlLytx+ZJYXOQELMD+F7sWLYeC44vBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804530; c=relaxed/simple;
	bh=0k+9gukb4d2nOwF1kjMecGstCSnz4B6J0e3AVJbML3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S51FN0ePQ3t9dUc06hOSzrB1ZaYeRRi9+C2YFlnMKkWbqImB5KeKLXcY2rj0hWgetGEmJQpG3n7ioeBTVA42BXVoq6zSmgUEJfPUACz078UpG5R/pytIQeAF8dEhczGiidVHChUOSBmRpY4Vdo10xZsuB52U6H8W0f0AnZqa5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIzBKQXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4wFiNXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIzBKQXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4wFiNXT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsUnY2385433
	for <chrome-platform@lists.linux.dev>; Tue, 26 May 2026 14:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+QHu6Y2IGL
	JOebsqeCCURWhB+4lJ2QY3Dg2vX831QU=; b=BIzBKQXtH4EFLb680QxmHRZaXg6
	isPokxSwlHA6WNz8Zp4w6qQ+03OTxs5gYkcMwEltbT51tXA1u5fUZSiMp6Lidu6y
	TC5MbO9aAzfpDLSvsOsvdmxCecMl0SVLNNYHQu2NMzyvghR1UsQ2zs2fAwmmHk50
	yKmoOMDf55oAfpPQY2cJVUyKOGJPU1QLNV3sOmrD1nK4Eq2ngjWd8eRuHXV5KVFG
	rtGkkRVg9TKUDHaXNXV0KlfOSqUaGmLX3L0YFMNgHZaaEx3wwuiPAP8m/ZxYHpmy
	RVeoXq9AzXftIc1hmOyFZKK0w1XKGccVpSZKzHJHUC4ZLSqJXnekTrvcv2A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs54v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 26 May 2026 14:08:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so10763705a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 26 May 2026 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804527; x=1780409327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+QHu6Y2IGLJOebsqeCCURWhB+4lJ2QY3Dg2vX831QU=;
        b=G4wFiNXTCMw0IPh7u0h4xxlB4d7w4Qf/yPI/BCoos5YqbmgEmTfLZryNhCi14xAwlA
         cWqWMdIhYGEw7Z4JDLIocXcfymrYyeHZKZQmTbpvVWxlSoMlw5IYfv6R9TGQwRJS/tHA
         8O68KKYDmP9j/0TF/5uTNchnq5PckHU2PPJi+cPxkjmbz9u+tJHQP41FABUW1AFOq83N
         GDQgj4mochICDSWWyQyMESSFmJXfNiwkOrUl5vYEBryQksXfIOdyQ5FWLKVgeKBM6WJZ
         eiSDUT13JcwCyCEMlm2fBAr9N7rD1+CI2FNceM26LGuTsjiRNvEon0oqaWuv+3JFJYw0
         8Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804527; x=1780409327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+QHu6Y2IGLJOebsqeCCURWhB+4lJ2QY3Dg2vX831QU=;
        b=NwJQiD6vc5q3DcVoL9cVzOzb4RA7UuNHEur2VmDHKxSdHKN21zGVAgNzWjvyBL+GTD
         oelGWaSk2jnTEEUYYTDOQnke7WOgpUWGNt3BEB2V89mK9xzLz8/Br/t0Jj3124yjHAoz
         tShb2nE6U9pBHpAI0VQsXYN2k0LazdK1MBGFFuZ/8AACYNZakpR3fT+I+HTxYFtCbVQ6
         GQ9VtCf2N16R6mLiWMjttBuedvwvOToJy1ZKvn7/UBlhGECF5GOu7MY82SN1yqwzktCN
         Ft1rCNdM6FMLz5bi6dS+oDVOdvAGYTIlhEbNKEZQ8KkzYq0slV/RD06z6rEAnC0WCOs6
         /xzA==
X-Forwarded-Encrypted: i=1; AFNElJ+cpIEKAHtB4b28dWtq+ONys4mJvsJ0/MbT+waAc86KglNwMQs9AftSKWD5tkSAEgaWzfosu96q4qMYgHMbveI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxlzuEhonRAZpIIrrcJJn2yPheAObz+0yuI6zmT84VbJRLTbMO
	tDZ3x6pPbjE2hPLdXvIz+m9bhlRxOPQWLTDLtTTl62UZ/J2dnOJw1hfb02am05HuKtGzQrP0R0o
	RU6Jam6fOh1JFO12X4E6YkqtgIU8V8FkoSg+BnMS2GMBLdOchz9RsY1Ndbq/9BxPX688zOyc=
X-Gm-Gg: Acq92OFujBjj1eDF3DiFbvaNbjpQAziQDJazsul2G5N/kVrRfCCKRNZd1kMtrZ3lwDi
	u64hP0iHhIqoQBegKogbuH711k1bVPjk2cZb8qH82t9JWEIse0U1HHVTc/AtnJ6EgQEeD0zgBQB
	JhYXE8VC/Tzm45OJNW5VoA4rBuEx/4fFCr2dPpUXYHSnFE81qCkoDptEqKB8V8dadLBqHvCb9sg
	IwpWUqTyPcE9EuXvr+RgJ7OEqdKuIdtMZwHoK9o8sg6K87HYEDZ6+Jyv2C7RK7Yg8G5qqfWgPLH
	YKm9yL98WDmIFrmOXsFCmBkle9cQBeY0DtCOAlhfUp0BAi0isAqGVS/RUHSn6i7pGhCKXyRqO8m
	sv/42PC8lyzVchC/HdVPCCQ6DRGHnrC7PV6qpIjXdGbWZuzVN
X-Received: by 2002:a17:90b:3149:b0:36a:ee1:fc1c with SMTP id 98e67ed59e1d1-36a674c5677mr18858657a91.8.1779804526635;
        Tue, 26 May 2026 07:08:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:36a:ee1:fc1c with SMTP id 98e67ed59e1d1-36a674c5677mr18858613a91.8.1779804525893;
        Tue, 26 May 2026 07:08:45 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:44 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 03/10] hwmon: Use non-OF thermal cooling device registration API
Date: Tue, 26 May 2026 16:08:04 +0200
Message-ID: <20260526140802.1059293-15-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=0k+9gukb4d2nOwF1kjMecGstCSnz4B6J0e3AVJbML3Q=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalH/EmdGemo14qDwlgvQezF/LCTJ5tOgyw2I WyeVxFlfjSJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpRwAKCRCoMiOKKk/o TzZ7CACzz1omupUUifiU3WxfnWeII7cqtd0z7LCTNsl+6MFTP0Q7nPg1i9kYPKPyDyRDHWSwHSA /KPR1PAsgcBWsCcipdn+AbhrO5pQ0zIzkxRVPJfGEedYngOELjCFR1rsdPdDHSk7fPMFblfZVeU Qu2TW5SyMDDa1eMhb8ZzoNqotI09L1kN4GznBqKX3/ChgN4eFDVUFNnvftquMootrIgtaPjgzON fioxrU1vYC0leDduNXZUn1231hu4vLVE3HGL3G1fs6aIcucXNs1IhhTAtIKNnRolaM+vFWy+zep 1iC8zMjhgJxQiazt0d1Iz45Jiw2lJjf8DVu39EqbJNNuZBpk
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15a96f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=_jlGtV7tAAAA:8
 a=ggIEzLyBpZPC2L1Vao8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: 1leLWWNkdIurWlCRGJNNs4VdzxzFE2R4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX5y+68vwbgT9F
 skOjBfpliZXaYSoPJfLcqj/NDlvIQpn554z2JCP/vzAYJSGvk7Zrtm4VwWmyrgeh0pF4vv9/J8+
 EWCvN893B9advke7Q7QZEgv2bw9DwhXosarEMuq5WFCVn4WhKHcJGFwz4IfnL46WwsDEFmlFpoE
 4wY00/s1xv9ha5jM0wi2OTIHwMLwHtTsiDtcyt5poCvtmuOxrIEZDXmjb45lgJjipB6JXQ2l8q2
 tq5YCTythrKsfCG7XOVT31QtNmPKvzxENfwr+ssX7qgTzWZqdZlKsoTBJHszBmQ2Mdg21vTO1Xu
 yWpNRem1srxa9UJjhdTXrVUjbhtAK2dmLRPI6JQj8yEkqtz3IJ5ldo4nu/rgz/Vs+lsbhG5pyUI
 4UcMavbyw/syStMFuAcYFrEAATRzsxUJw6VnogAO/Y8AZcYPjPe/oECfxg4oye2W84DREjn+hqY
 c5D1gxla6rowa/qag7w==
X-Proofpoint-ORIG-GUID: 1leLWWNkdIurWlCRGJNNs4VdzxzFE2R4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121

Some HWMON drivers register cooling devices using the OF helper
devm_thermal_of_cooling_device_register() with a NULL device node.

With the introduction of a dedicated non-OF registration API,
switch these users to devm_thermal_cooling_device_register()
to make the intent explicit and avoid relying on OF-specific helpers.

This is a pure refactoring with no functional change.

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

