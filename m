Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736BD1AAA1F
	for <chrome-platform@lists.linux.dev>; Fri, 28 Mar 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131421; cv=none; b=rB4yAuV9Hm/KgRsbX2mFCUgCPQtTISHAT/MeVsbsgKPNOsiLxZLWT/mEUOWq2+A8sQJWFPyt+XMu6u96ifcdjfMzRCofPodTlMWetfi7uEqnVB4soJmLGDQT1WiLeH0bA0bsgyg1IrBjigESmdDGnXV2YEI+LFdib6+7y4pLgAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131421; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiqRJAlnTbZc4GZbOZQhiOdOJS14rQVC9YgTsKBBb/T6RN+VRvd/NzZaoM4K9+SeBwWSwHvE4o7xUUKyik3D7H40M9Ym0YkKGlQrXinlFY4dqzIEB5xFt2ztW/GQviX/1eOpfGF82rX2tcWTeEsLR3nKOJ5gBmhBhrcRZ9aJYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=f7+2btJL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="f7+2btJL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224019ad9edso45836965ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 20:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743131418; x=1743736218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=f7+2btJL7R1skcDGPDq2GWyaWLFG1O/mX4LpCE8EDrmTm4J3dkPCDDB3FCtmhjmmBY
         1qdDkiw8N1dInc+e1M1RbW/uH5RhvtTddK3/fog99YI5yB9u1nTTRmaDn8TtvDiLgzYU
         I/PvXsLDQpx2KGWtLkCe8fnrjjkJ5IZa5N562OMOCDtueFogP20w6tzRctVL6WXUzGe5
         qyAQlsw/V238xH3oTdrJV4IDK82TGghI+7T+9UQm1qlHEKW6+7UzcmgYNEjyzqxJ2bGX
         N1oyC0z6hgf7n0tK5jHLxHkvHl2ZfYlGF7BlZv2W/+JLgIDAqXlJ/FNA6B99KSGUfOV5
         8Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131418; x=1743736218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=SG2cj8CtB1d+eljxUX9KXkRKl/9jjfXXvIspQIA74TWQwkWjap6KqP/iab3KTAGHLP
         4clbYnec2iMB/wa25tMIq4mX1cNRy+G4A9a3iNfCESLppL1LHy8+t0PLY0MIVcjo2k6q
         5n6Zu63px6wYkGrBW/WfOTWS+GSK82oRpcC53dleRv0QhdbyiesNB79S0vuirZWj5piT
         fnSvwYUIO4bJywtE377zyVURKvEBTGF9bGobEGIJhmT5e0AngYe24rlDlgr72AvGHlRV
         cLX6WuDAnzwgi88kziBYUEptVnS4pBHBEfqKqwyKLOfDuxsWS1gG1gW1I1sXkJg7z+Jl
         kfAA==
X-Forwarded-Encrypted: i=1; AJvYcCX3OXXfSOWPtTL6SyXQs0ZDsoDsQ9ru6NaJOiLIHErDQYNbvq18oYgcRqIXmrtY/FHnmvp4wawPJJTQha15YVM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy96tulvG6PHGdObUj3i6FIhsyZFThPT/GuRMDEdxoofCLRHFyD
	QSeAde6PArxTM04xlJzUPixkiHCNuZ+a+MShpd0LxIIWEoZEoDy/HTBPaFKwuJw=
X-Gm-Gg: ASbGncvcUks3wEbDnB/wOb0JG3+567lTXNqpxrsXvsvVft6W3PFj0LpocsJ5dMJ8X9/
	DIBlaIOk0BTohKnp/igYtkBiT1LhaQ/QGJoBe/mhqGUoAC0djqQqkwHCE9kOYCVVkqm/d9Funyo
	B/8YNd2t8BYIXmqpSJTJDUsUeI7iBB92Xp7Is9NUes/r6lao2EFvR4tSPEGbJOj4aBGChj3ugSC
	1H6a+3/A9p+mks9KD7zbsD/rF9MfVGO47IRJ0ApeipooHgaXfvfjGMuLV9mxQq3iSqs/J2m1p8m
	HvV71SAc+jkZwzcVvCvDDC8gAoYTUAMfOymDK6sTpE944Vbel3i+60Ky9p11oZIfWdncV3BMlep
	IkmdQTM+acTMbuMNkLXfjhapG7vjejtZRPkQukaNeZnpkl3Jp8AEAgyfr4+6f+9SaWd6tE8f7Lf
	I+FuRn4BqhSW49vQ==
X-Google-Smtp-Source: AGHT+IHobEzkQ2a6/oFoQL+lhbLX1JKOfW8BRICYcfmgFVFtQ+arV1esj4jUfvhTyOflSwK99gUdZA==
X-Received: by 2002:a05:6a00:856:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73960e2f356mr8117439b3a.9.1743131418365;
        Thu, 27 Mar 2025 20:10:18 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-0ab5-dc96-8a97-3edc.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:ab5:dc96:8a97:3edc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22324sm663315b3a.58.2025.03.27.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 20:10:17 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: kenlin5@quanta.corp-partner.google.com
Cc: bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	groeck@chromium.org,
	hverkuil@xs4all.nl,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	tzungbi@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Fri, 28 Mar 2025 11:09:35 +0800
Message-Id: <20250328104619.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

Change in v2:
 - modify commit messages
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

