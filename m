Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B80625
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976882; cv=none; b=g2mfiF6+9ENoaSzMeefCrcsNiIELcAP4dcFkj/b6ssy+JYI0uaDjoXmH0HiuPl0xbTayIHQdAw0CEULCxGcIBG9oWf5P17xi4LOFK/jL9nFWyOLNE/fnrMMUGn27LS7pglR7WTN1ZufIg+I6za4iijeSo2Q87wFJ3UEJmllfuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976882; c=relaxed/simple;
	bh=esUHlcrRUA+pHtsk1PBRB39p13V3lPQMBpZSJ6iPyMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c/0ENmaI79V6uXRKfZ02Y/bPXu3kK+qSbzIkTAuMVtLUCnYujqX3+cttjtEMHS6sf52d8/mp7vncNpvIaeg4YaoFZsBktsxmnuhQQkqOg2S4ICa8lBbG8ikYK+S4L83L+jjuaUJBO2UBc8gfb0gy1xwTHmW76yEm49yn3d0Qego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJt8f3nT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIQKvrHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJt8f3nT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIQKvrHC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VRjW2859177
	for <chrome-platform@lists.linux.dev>; Tue, 5 May 2026 10:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TweDK+EJ2ANXPJLzcxDTiq
	Bm3BP0/M0cHfrljY9hpyc=; b=SJt8f3nTM4+wRWUAVN3e/6y2A+hbSRyt8mGF3H
	+cWKae5pJdb+9hVLAl/Av6dGJJFH07hB72wc8CcZoo9l77BFhFTgs7mK4jdQRFYO
	XSOULhgT8dCnN0TCc5q2tP4IOR59LE/GLJ3Cr6dqJmxjEgG+OD/Ind4JA4QvtYmE
	HrA19xZot2zDGuU4QtCRemLdVRqzY9JZGw3pSyWmw2Vi4HbDmaWoOcXVXvBfNqia
	ZkU6YRn7uDsQVH0kfHPYGC7U9PEhSXY/AnFYZ8GY0uCKo20hlqZiLMVifk2BMwJ7
	Wk/IfhitfAvnteeOFbcwD1PhA5HOAFz00YLlueevMNLZlB/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag809-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 10:28:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e67a4f642so125849431cf.0
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976880; x=1778581680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TweDK+EJ2ANXPJLzcxDTiqBm3BP0/M0cHfrljY9hpyc=;
        b=AIQKvrHCXwbiQlr0UqHCeda4rQCaZR6OiOnYLMS4lC1Q6TZAIPY/lP0diND+pmo9Le
         JA5SrOXbq9q9/MyD/8bhyEUNhAIMn1SqXpmkE9/72Hx/CQPBat0uZeQ0Hwo4CKapzfq7
         APb45f/PzcETrSmfUdRN7+7WSJCJpqwsszZJuIGtDMiJh2HxDJwTz11t/6KTENI90kGT
         qZUvC6wM4kXQJsvN8dGW8QCZZNYTZhcJXxJt0Lgh6KYw1uJMX5CMdxlNLzNFuvH50N1i
         fmVwpTwic/hhh92wPAkZsJjRG/DpieLNLo57N4D9sQMgTfKufosvMjuo+dazD+xXynI0
         i20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976880; x=1778581680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TweDK+EJ2ANXPJLzcxDTiqBm3BP0/M0cHfrljY9hpyc=;
        b=f7yBhKgzgtPmqDzSHwptbj+ovhBH3aUd+qcSulxjiHD4sMwui9mp/KgyVOw8HNPEiB
         W4Vd1kmjI00EUiGnSla+Bv4dXiGhDr+IUbcTyXufjFkrpfoH0FHmCwS+9TUJKKIIFKBY
         FbaXu8VQBixh0x9ND8VZ+cZJLCmB9/TjbvMl9V6IGlDKpuwS6qAbaEZVohGPqSjifHFK
         tpLCwBMIlXBsCisT5AjgRfZPmnoFTHpvd7pKZAIaeNUqpJWz0FWhE1aLU6Rrinly6eXL
         Pg1KubHWLwEf085Eh0BkwDjmiexx8HJ2AA/RqH/QMsKKb+ca5UfwEFP0zZ24NQ4JcQH0
         AchA==
X-Forwarded-Encrypted: i=1; AFNElJ/X7KRVCVaiCgEKdt9N5keWJatDSpTtnH56d7HE5Q89I5XaihMJ6Bod3a6vJvxJTUPkbLGwckbR3+6QpbUF59I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtrqBbZaT8nmSQuHGo25v6F6rREu7pyNQ0VukN++uiIEyJk2nl
	sBZNdhNhqKgi74jxmVrK2YuA9DjLwabHvEdnA15aLCwBwfntCwnxL+u0O6taSsHQ3krnxOdiPPC
	y7lGq/S+H0SwP8kRBewQLtyEES8Vh5pVZca7s2ZRXlyA+oD58z0w0U/YuCm8hs37acEOo88s=
X-Gm-Gg: AeBDietyzT37lv9IDHtchezuAv+pt5e/B9Sqe9UVYm+B8rCSp1a59gwWNWs6vpq3oBq
	bdyseMpsqmcQ8vOIr62FBVUmERkR84qGflZuInmnWFLcvqRBCvkWsmCujbonW8wYuGFJGlmecG/
	VJFB7BmL1L0KvvlN3fScPzzLbbJRyGNOxaTzvWeod8ViWEtGwb1Ob5GNIWtyNWADBpUmHnq1/0P
	bLxOTtpGKnMkpJa27LPT2DVgdzTTuD/dn2Xxa11DdJDMHSWzppn9wR6oI12G5VhI5ZN+VgJ9rvZ
	I8PyVM4d2ltu4tmU0aOa/LungVuVCeRS+J4n+KVUn4SIKIky31qONI916OFIA0quS2DvUKdCytd
	p+kkAF/IPfX/76cCxoD/t7as66WrVsbPR+g1yT7BymJx+kAk=
X-Received: by 2002:ac8:5a81:0:b0:50f:b81e:c65b with SMTP id d75a77b69052e-51306b43477mr32427551cf.59.1777976879801;
        Tue, 05 May 2026 03:27:59 -0700 (PDT)
X-Received: by 2002:ac8:5a81:0:b0:50f:b81e:c65b with SMTP id d75a77b69052e-51306b43477mr32427361cf.59.1777976879382;
        Tue, 05 May 2026 03:27:59 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f249bbsm3189429f8f.36.2026.05.05.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:27:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Sebastian Reichel <sre@kernel.org>, chrome-platform@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] power: supply: cros_charge-control: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:27:52 +0200
Message-ID: <20260505102752.182089-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=esUHlcrRUA+pHtsk1PBRB39p13V3lPQMBpZSJ6iPyMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cYoxNO4ryDqtiJmdaOnGQ9p4fOKrW1flHj1p
 sG7Eez3iY2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGKAAKCRDBN2bmhouD
 1+CsD/4thZbfIWqhsgH1OLmIjgNTZdRfe+hF3YvZzy0p/Q+u4n0146FuBEf+ES/aVHUsIxSqjox
 R6aERZNSeKvJwm6J/qEl9gcVjvwVBKjljTPeNOm4ZcPBgRYGyy1lHVod5cMPx24Ztf6PpspGjuZ
 b/gbrtbjuqKMWokfkzNjk4YBK9VaQTJdUzXujFHrnR4xj+Htg5fzaXUWhx/M8LZbfV2prHV6f/6
 j2XlPLi1JhGF5Q8JHBdruTvSCse1Cl7D9nbwTZUoen+Q4Zx30bBfTe+lmHtMlorzT+GuUBObQsW
 dcB3g0EYUld86lnZOH2JSk0oIuK5KCrztkxwTTxfvbwUGzoGGS8WnjVCJPlqcJZplkgVPrtgJ3P
 cFjXvxyD74n5qZmTXzCUKE0lwC37ZUbqzJKtdrCtLbYciI51YI5sSIPLpDcihTFOG0/hnjg4b+T
 CZXhVWtdOcQ5mxz8+c+K+gHjI9vLmCP7MUD1dom+4GeSikE3QqH5rbDbr7DeeLILhObIoZGOxQO
 bLUUnKWKA7B6HRlGRwgNypm0Lmwg+pf3q843dr6UACjhkTx0tZcmEj0XlYKsKjmslKnR5HE0iTM
 9WcSjRvJnXtTBqkNyD4YFR3EDEJ9qCBi9wZDZyU6wjNqA8eo3leO4wt25w4Bz20rwkws36EG20l P9vhun7ngypVJNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXxiSAcqpzeIL5
 Xq+2Y45a0roRVVsy3/qEODLQxvxL2qOEAV/VyaiwnAD4A/a0EkbkxoSEX1zc+L3rfOaw1qMtLcM
 vtCNuNCW2zy2xHvJRIsTIJ62NIcaFk3NvocTzA8KsAT3rrYAeJ+zj6qG3gb3Dk/q5sI4sQvYS6N
 +CeRbCVU7m18gosEkhsCWQztDHTD0pHdNDkM3/NePHSjcGO5ouRHzTZIfqC3Y4TnVOGX2VwR5Bf
 clKY3e/cNL5oGHgwvMLs4lDft22e4A0PkxV1fUQ5egmDf4kykhMtUPbGH7HrQpqub8M1+T72juV
 Aq9Zk9nZ5E14CrMg9trlFuESQGhSkWhnMLLlz1MmYdCZkCgkElCQbCc0DxRmj7aIvuKGyvzsjpd
 q+hSE1mraoVgT1ZGk8jKbaadfq8icSpuIG/nqMCrlcU45OLWzAF9YnQ4yt0hfISPS99mVFqCqnR
 V0GeENiAABuIb3xRF+w==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c630 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=-VWkRg1N4B0ATEIe:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VTue-mJiAAAA:8 a=BzP98TPolLMEYMmIy-QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-GUID: FbDtO3DZdHiTLbgsCyodI4CkgEVD2YB_
X-Proofpoint-ORIG-GUID: FbDtO3DZdHiTLbgsCyodI4CkgEVD2YB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/cros_charge-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index 53e6a77e03fc..6a5e54218178 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -323,6 +323,7 @@ static const struct platform_device_id cros_chctl_id[] = {
 	{ "cros-charge-control", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, cros_chctl_id);
 
 static struct platform_driver cros_chctl_driver = {
 	.driver.name	= "cros-charge-control",
@@ -331,7 +332,6 @@ static struct platform_driver cros_chctl_driver = {
 };
 module_platform_driver(cros_chctl_driver);
 
-MODULE_DEVICE_TABLE(platform, cros_chctl_id);
 MODULE_DESCRIPTION("ChromeOS EC charge control");
 MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
 MODULE_LICENSE("GPL");
-- 
2.51.0

