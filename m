Received: from sender4-pp-o96.zoho.com (sender4-pp-o96.zoho.com [136.143.188.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8A33FE16
	for <chrome-platform@lists.linux.dev>; Sun,  8 Feb 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770588824; cv=pass; b=Rm1kRegiVN++Ng7+n3UR4l2T13/YDkvxuDuvXdV4xZClFxxLDJ30btyzgzg/5BfzxI7kFE2SNwm9kN6cNGNrwqx+o4MaeFZRmKevAHhXhz6vgkvbeqWY2CYpskBu7B9j1GH8PcJmbSrFWHiCEsOQplAcCWSQTCtnf8R/nwtw+AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770588824; c=relaxed/simple;
	bh=OXy7lnYJt63G+ZK+icMojUp3uuSlcM1aQhtn1b1h7dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H5HrryfEqa6lS9v1XGM27BGoHVHQR3JR04bEEzd1Ljbuy26NkY15YZMCtMJIi2DQoXLgS2ZMHaDveilTDD2PZ8ibiznFyIHEI8DEVJhuAC2wVoRtrKZdUz/uwzTm4jjhR3PfexsBcB2pciTBa+0OaocHhBsbKgxQR54XRrhc9IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b=bTsFz7D5; arc=pass smtp.client-ip=136.143.188.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b="bTsFz7D5"
ARC-Seal: i=1; a=rsa-sha256; t=1770588823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DVOinsv+W0jp6KwVS/uj87rP9WyZDGoXO61l2tj6IEM4T8An7xFVM/80TwaFVQHEjSxD8ny+pCwXcFDUqsLZOa8XL1SkSiaoLzgUr/+MyjG1xhzzn564HSTCLnk1bs5p9n5Qo3ANBN+HfV/k6alpvJ/tkM4ssX5I8T6DBC9huYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770588823; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qkw6smFiL3tLFnqxUpXubvr+qADDrbNaIiZlnqQm1lw=; 
	b=f4vryaKWxxVpVSlvng9a5La6KjVQ1tPw+EYaciYvRs3LFJSiWhjHQPzCmMXWrZJNzxJ0vrgvpHuRi0EtzdrtJKdIFENOVVAbzp8z2XlGO9e5FLzOmPML7Mvmlh5euymVDuAE9sHeAsPz4BNuyqMtapNWSN2H9MZbaVf8tolwYhQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770588823;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=qkw6smFiL3tLFnqxUpXubvr+qADDrbNaIiZlnqQm1lw=;
	b=bTsFz7D50wUt59dh9KKelGan+uvUJruZ9k+/83jx97bsGAhaA2d6yA9SxvZPc8BJ
	SZY36O5C5xSTynhnqz8uzZzPlXWAt7ybVNrj/Nst/ibqcvVbVrosFVMW+6Skjjikaw5
	fUxGo8jOBT4VeXkiveZM256fsPUWTArhvop5aYDw=
Received: by mx.zohomail.com with SMTPS id 1770588820836158.80036972926212;
	Sun, 8 Feb 2026 14:13:40 -0800 (PST)
From: trunix-creator <trunixcodes@zohomail.com>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trunix-creator <trunixcodes@zohomail.com>
Subject: [PATCH] platform/chrome: cros_ec_lightbar: replace sscanf with kstrtouint
Date: Sun,  8 Feb 2026 14:13:35 -0800
Message-ID: <20260208221335.16030-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112277d5898797d730888bf7f16710000e1a6b117e85d94eecb74313e867d779b2a009fa44c2b29a94a:zu08011227677e5f8c16724e1a89d4bff60000c253ff8e007642ab9af7bc8df77c17f437eb69c3236797e48a:rf0801122642d91f23c3610ceb7796bcfd0000820c4123c4948508a83a70d8cb109c0b24490387b0e3d329:ZohoMail
X-ZohoMailClient: External

Replace the use of sscanf() with kstrtouint(), which is the favored kernel
API for parsing integers from strings. This avoids format string parsing
overhead and improves robustness.

Signed-off-by: trunix-creator <trunixcodes@zohomail.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 922758c2cec1..e455ff440b11 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -243,10 +243,10 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 		if (!*buf)
 			break;
 
-		ret = sscanf(buf, "%i", &val[i++]);
+		ret = kstrtouint(buf, 0, &val[i]);
 		if (ret == 0)
 			goto exit;
-
+		i++;
 		if (i == 4) {
 			param = (struct ec_params_lightbar *)msg->data;
 			param->cmd = LIGHTBAR_CMD_SET_RGB;
-- 
2.43.0

