Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B2227E92
	for <chrome-platform@lists.linux.dev>; Thu,  8 May 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692552; cv=none; b=lzXV9tfmVf/E3Y6uUtubeUkNe7Gy/Wkwnx/V+osxuuW1rhopIlO7eF27xJOwghgD7JWdauwdGpjHy7Tt+wlGOr1VziW4JyXlsKgDxGX3kxgq9SGYlGlEGoJPpT5l+fw0Bc1VoVem2CD+yAJ4SMtvciGPsFHLnfA+WhJhM+3ykV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692552; c=relaxed/simple;
	bh=b3KQHbcle90b43aec774WIneNV4nZ170I27rWBYWVls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WO4c0Pt1eh6a7keapqhTMAw5aIfqlJx00gCJbSNnYYVD6V/SeVRxJH+/HNK4ja3hTdpPkQwK2Z4ZzVOsmbSZ+Q5fT1c04WH1SPv/LJFIPjoGN1psM2AZL1VsJiYiW4xiWcmFsut4cefVgeBMRCvBjtGMs2lMjRa/6O0ZasrDiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=Bj+OFkkH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="Bj+OFkkH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a7e126c7so723031b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 08 May 2025 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692550; x=1747297350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=Bj+OFkkHdxm8lpQE+nID0oXmWcmf/wiEauwHwt9tFyiO7uW/enAVLTf1iGETdNn9aw
         iveaIM8so2JOJKKQ09s2dYF404A/bDP3hOVUagdSQ/QKHBdO5Gxqm8uugsmZztCl0mU7
         LRMEa89ZTSjcH88EMBTI1mwkgFccN5m6Mrkm5SB7pSiP+Gx6dNZE3yldsN65o9pq+Ahl
         WIK7PvaMT7A7Ov8YcNqyjQmzieBmBP66+QX4JFM0AkXhdGjpxFI6y56vyQqhrMvK0x23
         g7xi5xsa4F3pKQfk4CL+KvBKTNBuqigD1rNwNegl9fGxl2Yo5l6QIEEbK6kmZo6nWoLo
         Mh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692550; x=1747297350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=jvlFeI3FgbOyE+ZuByXDL4lpbJX6fjX4uc+etsEo3hQusq8sxxqkN4WRaekPS3HXOx
         XVJDW+UTRSD9ZaXC2J1t4N2SOWSiRedlpaCCeNrijG7eHdzP9iG23AJwcm3UEicaVFpT
         VRtS+YQCa2BvYyuEUvUfwHcGge1xwFxhl325ICSc1Xjy1+LVc28FueNTNEn05Oqb7GAQ
         r2Qr0v472zy9XO4K1K2IhR02oPLkkqfb1WADuyAiTlkz/YHZtXBeKVzp3FwQvoM+E1f1
         uzWIpMKSioq6E7wFjN52l0ZM/H4+mgLEvPkaqxgbln7OJU9L8W0VkEgitxtRtFRunGOU
         wdcw==
X-Forwarded-Encrypted: i=1; AJvYcCWGx2dMDL+O3C235tGCKzD2wrdhy6axSmZeWf1bYQLtwHSA/4dwr35mJ10GB31c7eYWy8bL/F3t8PqdY619PyA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuMiEBj69g32PyPCfJOFijwBnmVMilyA5mAkipirViP/YJ0Tl/
	0p+doRTn8umk/9Z6V/biREL7PQilxxBg2z5VhrsWdbThNAmrY+RKUCPZomdBbe8=
X-Gm-Gg: ASbGncvcsr//BAQto3pa1pxgKQKKuvxDdKOc7BvJE0dhpvScpXk0UDHUbbqbxti/xsZ
	gwoOwS7qu3tn4IlYgTbas/RQzUfsXGLBSHTSwWkS/rlHxUgI1rpwtFjSq5Uwb+b1muwE8UpbjLU
	J7k/k3v1yIobURCZxEvZfR8yYjXeq1dLlQY5q20BSIIMFCsMChVzJONXrc/vYy6sWEfKsraMbv0
	rdNBUGpdbQlxp92vifqvul74riHqhFO4zmTRymq8vzVjwohQiqu7YuX+KRFIQUZDz2FaHlT3aTv
	CbtNFPK62nLhR5jH4PUslUf1dgiMkS+Doy8RrOE66kOQMUJsMZTyrzwctrku/CfIP5Ql4bTQZNm
	CjKVmkqwbGyVZBXhCCNYkMeLYCHSCnc6ieYTRoWvMgLdcZHJJ
X-Google-Smtp-Source: AGHT+IHcA7QydHX9WQFfVC7ZtjQ8Be9/mnnHoybztapFsLeeWUiuanwzBOsdq80SzYVfbDhXjL5n1g==
X-Received: by 2002:a05:6a20:d80a:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2148d88b926mr9160923637.38.1746692550391;
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] [v3] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:04 +0800
Message-Id: <20250508161334.2.I4b139dfca0cbb20f0c9096a40b47f097f40ec235@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
References: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

Changes in v3: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index a8d31c3126f8..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -330,7 +331,7 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
 	/* Google Dirks */
-	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

