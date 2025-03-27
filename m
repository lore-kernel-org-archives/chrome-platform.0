Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C001C6FFA
	for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058796; cv=none; b=BE/H4TR1Zm3PV4a/Mx/fgIgpdu88z6nhmgp9xnWD369WmrNIpKVPCmsylzpaadHNF9s1MKvSJACipKxlbtrA2rPOz2t17azk3epSicCenmEMaqhCU/rZVi88Ray48sSpNxqpTqnjdrs55dQ1GNF8QPtk+h20xULWRshy3Aw2CBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058796; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mYTur1qRIwKs/loSLx6sbd9aUIHIduL1PTNV3pciK7wprBlpaHMKhRc92yDarM6FvWG/vRgM35hNK9N4TfOF+9PmZ5nWX4EO9GZjURpWkSnJgF7NKQfSmq3+3IISlnmcorfsP852tiA8slGNcaHutS8SwKH2QFGWa5qjJnEZTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=XtXCMAbm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="XtXCMAbm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227914acd20so27548975ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 26 Mar 2025 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743058793; x=1743663593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=XtXCMAbmfj5ICZ4NNtnBryJY/1Oj33xXodKmWeORZXCauBtnbgNynaqnMjPTeO4Mw2
         rvV/mmFZGYJeA19DrfBs5MqIy8vUhsaRVLV2lHMDl6ZOv5jYSWYogo/OzyBWrAfrfLue
         mgnOSBFcB1CzpufYEtXIvKpM2uc6F4SDL+LS2mfUONzilBpgNF2GN3xov93Tr8Up8Qe2
         QIP7TLmGW1jDpdYLI4awYS/lbV6xKUf8E9IA4q5AdS5pw557TqYU+b60XeAVfnF8EVxm
         ot7MSkl1fyhmO7zHKEOIYJ+d8KXzv4ap9kTycEdhsluO533AxADvrCv9a1AXNsecieO5
         uEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058793; x=1743663593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=ht9v2UBUKI2inuNWyLoGiTpsRfaBQomu7bo6fkRjW7NNO5W8qJmn/S6L2EhNUCZYbx
         9TSwQkYtJv91hd2ZhbXI+/83lY+VSxZ104lynvY9q4Z7dzobxXFGsPYvB48rB+i1lCRQ
         2H66V++Wglyrw/3C3PdZ6ZWPSjpBa+uEzGjRQL29dvIF3bxQROwHf5iJ0O4YFtkioz8R
         GdMNOqCg3znbh1pSnuxC0i1/JkP/In9wBkbGush4SE95qo1LHxVsEu8L5ZYkm1KluwV3
         23qmLaYdhdz5ZzNN4+EiNJsUahQTw35FuYBBqfpVLJOsIfoHOf5spWE+nfDEaFME9G5M
         pcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgXbIlAFiMabg/wXK2fc/isncwBnc238X/X2dc4VyKnnjGgqmuXe/zeYtZvm23HZh2EkkuqdJJZVMN3gR7IpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqfz9lE/0boAraZhKfPR4ufTYbY1QKttLwM56inqi/NVgkTrpg
	yrj5tD8tzIFjBHhl1KJuT7UwiYw9IZe0rS4CRbIuqutCydbBcnV9oSWU7H100bY=
X-Gm-Gg: ASbGncu4UBsef8G4DpL9uaZ6TjWi7fzHMH7S3Qrle9RCeBgj3RzeDGv51dCG+h2VbCw
	2X3X+0n+MIG4feOcbrRH7mnExNYeajV8WHjakCBMAbu8HGbWbrDgC15X6O1CI3IMRYbwoYT/RBF
	BEZa+cF3+cL/6a44o6z12V77+ExF1pGPh/XL1kmEut809q947kQwOzUFsiY5JddCUc9AW8Dzx5z
	Zn9BzvUB+rvS4FXKB/V/AoGQffZ6BznMJhpPcoydXLyuXIUi3PyRoPDMwzigrLvKDrk6HBX1Iop
	vpKy+isH2w3gInXWfU56zInhFbn91CT9hsXsFPwdwfjKGg61xXs8tWRuROzdfTTtBD7slmi65ZZ
	xXAScLZw8xdlwvRp3vhR6B5mGt3utqKZ+3H0xh/u3fLnecTi+j6vA0EqI1iGa2vqYD+d4cF2Ec5
	n88gCUsHiz9+gMAQ==
X-Google-Smtp-Source: AGHT+IHnETWyyanBiU2twDZ1VaieT35/Fur+NGUXFQac0h6cHFF/+Ft9G2H9gQIlqjGEPWZaiJQG1A==
X-Received: by 2002:a05:6a00:35c3:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-739514c4fc8mr11981390b3a.2.1743058793466;
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-6468-2896-023a-3689.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:6468:2896:23a:3689])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fe33d0sm13513053b3a.70.2025.03.26.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 14:59:00 +0800
Message-Id: <20250327145729.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
X-Mailer: git-send-email 2.25.1
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

