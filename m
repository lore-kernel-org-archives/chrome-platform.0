Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2441C5D59
	for <chrome-platform@lists.linux.dev>; Tue,  6 May 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521041; cv=none; b=Hs4rFtgnd8RHT9h1ceDQjwjyg6soZhks9OZ1zpcQdkds0a3PD0a9VqiUWARIYHLhUm0lknMo2yruF8rimr5BjxcGcs54tHEpH9g1gUTQp144TaGawWtuq9R1dxtgAAEb8yC4yc8El2J9fQRk5mBvbQFvLQBs04H9Z2Vid/PgKS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521041; c=relaxed/simple;
	bh=GDqdWLvUxQ5sZaZpzIINaEq6cjYVuEXEjYzDVGeYBXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mvSwU/vIqbM8ARD0xCY1UBfqCk7C5OVr2prICUMhfqUJmHMb/I0LeYy8Cj8wmxhJdMbbPT8RxpzEe0TNs5t/Bbm8tKsBR+z4os9hgHnMsykmc2C81xwxmgm5Bg/qRe5oZ2fKXwkXRYNTo82xbfNXodRVyjCXAvjV2uC26KjKysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=vmd2PaCl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="vmd2PaCl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b828de00so61438185ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 May 2025 01:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746521038; x=1747125838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=vmd2PaClytojZtZkiTJpq9y//4KNVs+4CT62rlsqsVFp8UagtGuOSGF1HQQoCq2Yg2
         t7aLcgQxtaZm0BhLFH1J+L35Gn/zXtZJugrLPngaFnd7PXow5GvnVzItbEzvh0a54r9l
         hwzHkTog4Q6+N8IpakNY63CdTGUYnl79voowwPijKg1JkAYK0Iok1JiIbkzinw+hn1lR
         1+Ii36FOckIggSMcUkiFcAdshF+ZkL1/YKI2562B3M0aiRp/txQiXoFeQw7HPgWo1uZw
         sS2B1Lfwcr1fKu1udAqc9JR2WPYee2wQhKu5OEH/LLFkx7t0lNincXkYjRzJhCOaBn+j
         IAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521038; x=1747125838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=BFQvgxTtiZW7aARYS/7sBFqypKtepz5prNMOIJhaAHaT3CxZjxmzPZ8AXm4nbDDvuy
         p3PXvuBdIsA7cOxNVizE1PogdTKWIaR/KHaNSd5i+D46UwaLZKXtCsqvgXg4Cq075myN
         OY47aUu3Qu2hDfxLeB6vw/ANacj5yYR0kL7tz0+Q+70VGr7akbb0RnwuUSsFl2tvIgGa
         QOQqLYpZadOmLlzQDADTTD233ba/uY7fPOHRarbOyHMvoxLHk21PKiTr7J71VAlaoICY
         LecAD+NZ8EIvRQdTuRA3Ru/mjQM9xQrGZd9jGD3h3ZcqUOov682RhEadc3Z1COA00frk
         HuxA==
X-Forwarded-Encrypted: i=1; AJvYcCXBxptqJ43rWl2f/oxeQt+Tokzg2NNmmHnolLYVIi0pcg0SQ5QCbTTu119jkLNf2jAXF7AnqCff4K3dAWwE5Oc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYUNx/yYoVo284yGS18Pd3TobBOkBN8MtgFQ3KBgmDh2vBT5GU
	XYqIqIY9JFyXnJfbwqmFx2J4z8clbr4GnUhnBbwvd/CKsqNmMK4I3qwY7P301Y4=
X-Gm-Gg: ASbGncvjYT5jfsIbUlxLgiNgGd1EybRm44+bqgkq2hif0aCtZdevQ8Wx5mcx9aPpCyf
	vRq40OYRHMh4XuwowOjXpCSqp3TyA+1TfWdEY50Yklcxpt4MNkLwAsEnHR4fjER3F9Z9GS+NS2I
	0dncE9OwAGBXWO8yFOgDnP3V1lKCsp4V5ZDp6MKHk1aXbzIeZ0Bd9ZSpC8h14AhzS5zKbApoJS1
	2SpTLhsbX3MbrrET8TFjxZqgzPhnXpDgKRmIuRlC7fM7TgOkDO1MTTuHdPXeUwgzyiXfS92O7yf
	K6GBJN8gUBgbm6BDLbGIFq2c418hGO/Hws1RW/DR2BOP0LCsQUs67GFPDao0yciXklwJ2U/0ySx
	V/CK8aQvq4vPejcYokb5HgSJOOlzdFJGBtLOdjQEoPxCMbdi2
X-Google-Smtp-Source: AGHT+IFk3mHr2xZ6xTjxZ/wIRc618+Ar69pkMBFg8cgeJ5yWmwYmGkUh27jGm4sfdv0XmyOg5nKHEg==
X-Received: by 2002:a17:902:dacc:b0:22e:17ac:9dd8 with SMTP id d9443c01a7336-22e3633a6b8mr29134445ad.29.1746521038464;
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f1d7sm68406215ad.222.2025.05.06.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
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
Subject: [PATCH] [v2] media: platform: cros-ec: Add Dirks to the match table
Date: Tue,  6 May 2025 16:43:02 +0800
Message-Id: <20250506164224.1.Ica91496a34ad5c3f9330c1a7992f10eea10e471d@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

---

Changes in v2: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -329,6 +330,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

