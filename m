Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97422EEE93
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 01:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787621264; cv=none; b=Sdk0dh07Ad43BvKIMAkvcNFW217uy1dbDnraLNYskDZZU5r45Dd7L9rW8QTdLAmM3Hrh4Uqes+sLEgDUCl3fhTDfGdC76mXHvc6QISxVeFCNyqxL+Yfh1El24wBjhQYwleF28Z8ee5yQ3JrZMNb4ly5MIPMVCl2LeClwx+YzSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787621264; c=relaxed/simple;
	bh=WfBVElqMKzG9ZLe8SyUCXKocSSh6m2JvvQa+DPy++VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISdn5aIGyAF0Bx/19kzmfW5vcE+6Gc6VcTw+TDtVUM/WdRAicUnZcD9e1Il7sl/UGlSyZRRSOrPhdJ+AExu9f3SAULlVK/imusblF9Cw6bdo2ztxxgabh+/v5uaVN8PMBDczz0iwfT6BO44wcLisJgTYPJ2jHFxB15pWIY+LvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nql8Yj+F; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nql8Yj+F"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so3612588b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 18:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787621262; x=1788226062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjn+wpkkMzFuh9sILOPDdKZBa80uG+b+W05/ugqTzvk=;
        b=nql8Yj+FoeSbXyK3ZVGTT5QGuN1vX3dgucZF60lgRAdsyPIB7ufAdFb7BXVsXlRW58
         OFIbZ/6sdZqQN2Lc8wUpDSqSoXKH0jLbky5q0XNdFUbDsdFinIRX6UktqgFvxTmpMSz1
         ZljDlGCMs/VutThn2B9KQWrVIejnR2QatkJiD22AyHgD7iT5VpmwMWEDX1e3HkZhbfF6
         11KusqUBcSw2D+ivWDBvOBahNvqx6V8xmyFl95x46KVHi8EFA+oNwFDag4B084myd4HV
         Rl8VBq8kChSOlbDuuqnUV795aI3wbCIrjnlNcmw/gLTi1ojEcVGWt7rd657dESlBYguK
         VDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787621262; x=1788226062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjn+wpkkMzFuh9sILOPDdKZBa80uG+b+W05/ugqTzvk=;
        b=OR/uvKdg3x+LMXGdleN7yVH2SMpWhSmfafAwC0H0qo8O5GegyzyxX1qV/huP0nm11z
         mWz16DBrTAXc71vP/fVW3aWVAT5Jg4LYRLKjG1TmVg7LAKnBwEL28OmuIZD7+ZCtVdXc
         5V41Ng18Jo+qWAIk1XGVRhB1WtbKXlDmAfTj3KLDZuwUjXqNmgIZafUK/PfjPoTAMjmy
         DEGOQTBdrBOYYyWYnNcRDWHsD0L9Ei37PHhmjpBD6Z90WGDzxtZyxVyZwVdEIhlrauGn
         buiu01TJWp4HX7ZvsABlO52M2OIoD9PGC3BZEiHDq8RjsHclqwirYqIMdTAhISUQhz9I
         72mw==
X-Forwarded-Encrypted: i=1; AHgh+Rptu1J16EEGyLlmODgutl9rAM0wkpPLnJFmaFsTKCu/JP1/oKsN4KTunAA2lDmT0hMTysXYLbl77EOlPX5QmHE=@lists.linux.dev
X-Gm-Message-State: AFuF++kOg/1Zs0ReShz5MMNPW1IRC0bRoLIcFs+EqTofVjgANzEIuBWC
	QdBOHLELbqUr0BZfjPKmFWxsCrdKLuJ92DXBDqEqlpYgve5mwCvYQ4E=
X-Gm-Gg: AR+sD11M2+CDKwMyKaK4DKXwgpgkkcy57j6gUtfrWH1603CSri2DsLUIakc3ksbplXw
	HF3wxJV3xoNw1E5BbiTmp7Zm4CWGa8M1E7C3TdlUvI2/zyWQwYTpsvwRDHojYELEkugKlFlnMsW
	wIluVCs6f6/gOA3TsVRbTsdQlAcfnX/KGz2HgUNcJwYb9Sz8ij+nTQFx9myPWyPDcIiR2kUruxN
	LVNDFmbbzifvHLFtbYy0tvNkT6kTloUZYeUSvoXjHA9aGSYn+EPYKVOWqIW8oIjuy8sU8snHhGt
	iEWCruF+C1nwjB2OK1R8owjE3DWI15iZoZ+qlIsNtmtqSYcow3IIp1CJS+u21hw3Eij3MdYmTEy
	9qOUQYchh699jden8frTkYTDTL09491dhtvj0VogPDjz13fGYX+6I6zyaaIfAWt7RaLz1SGUjaC
	boXkb8DOhIVs5gC4uYnERg5lAe7ysLFmMg7VfYjBfj11yEPu7P/LwmBi3kvDeEjn2E175hUVobr
	7C9Pk+WCWFx
X-Received: by 2002:a05:6a00:1814:b0:84a:646f:193 with SMTP id d2e1a72fcca58-8520b06936cmr37618167b3a.0.1787621262149;
        Mon, 24 Aug 2026 18:27:42 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f153c75sm2411181b3a.49.2026.08.24.18.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:27:41 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: triet.hoang.dev@gmail.com
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com
Subject: [PATCH v2] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 08:27:24 +0700
Message-ID: <20260825012725.8908-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
References: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the resume callbacks,
and reduces kernel size when CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Use EXPORT_GPL_SIMPLE_DEV_PM_OPS for cros_ec_sensors_pm_ops
- Wrap to 75 ish chars for commit messages.
---

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c      | 2 +-
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 5 ++---
 drivers/iio/light/cros_ec_light_prox.c                    | 2 +-
 drivers/iio/pressure/cros_ec_baro.c                       | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index b971f8b646be..551b86236abc 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -311,7 +311,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_sensors_ids);
 static struct platform_driver cros_ec_sensors_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-sensors",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_sensors_probe,
 	.id_table	= cros_ec_sensors_ids,
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 5133755c2ea6..d03e40c91582 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -862,7 +862,7 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_write);
 
-static int __maybe_unused cros_ec_sensors_resume(struct device *dev)
+static int cros_ec_sensors_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
@@ -879,8 +879,7 @@ static int __maybe_unused cros_ec_sensors_resume(struct device *dev)
 	return ret;
 }
 
-SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
-EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
 
 MODULE_DESCRIPTION("ChromeOS EC sensor hub core functions");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 7ab565b1fb9f..b1c92de7922a 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -249,7 +249,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_light_prox_ids);
 static struct platform_driver cros_ec_light_prox_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-light-prox",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_light_prox_probe,
 	.id_table	= cros_ec_light_prox_ids,
diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index 6a567b6075d9..e4bc4df48d01 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -192,7 +192,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_baro_ids);
 static struct platform_driver cros_ec_baro_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-baro",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_baro_probe,
 	.id_table	= cros_ec_baro_ids,
-- 
2.53.0

