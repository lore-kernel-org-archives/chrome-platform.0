Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82413559C0
	for <chrome-platform@lists.linux.dev>; Fri, 27 Feb 2026 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219203; cv=pass; b=W/9lKxLhukSjRgP25ySoY6jk6KgcV7cgv9Yz4VGQ1BCoE/ou6q3huVPr1pK2gdlNYGcEaS79+WOR9kSDdbRxc3w3/J5w6pnl7Tx+JKvp5B8/AFulyktYNix6ESj9DzXkHv4kdSzPPLcxv3QruZi+MJs52VGsfhEchYVmPoah4+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219203; c=relaxed/simple;
	bh=T5OAaNmXzloJNopVsTbfdx+Ep2VacjxPhw8ZgNFSOs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox5+VJNrbGFz2GbI4+OIcriQqaL03dppg9uILOzmZstdWwXRdznToOgn7whbrgzqLFHvM9y8VdrkwA8LhuaC0XcSvygH24SXF029PRwo7LUZaMys8UNyyCb81TT9k6sPixWs/662I6CpLksMyFhQAydDo0QLNd7j8/i0F6KD4Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ps2O1zd0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ps2O1zd0"
ARC-Seal: i=1; a=rsa-sha256; t=1772219199; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UxTZkdwztUkzj50bvT/+ffkqthW9DnGhso/nRWKwlDdMWou9FLwK8ij9lTt2vl2xu058wCtVscpZqFpGqvUtJKGL2lTTbhUZsVelX37AuVKjB6z6CZlpygJNBBfKPk92xdwCToTYPvebOi0t7Tt/X1mrd9x3QGrL3E35TdmrCSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219199; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HdicsRgarBX2PfmY3asMS9OdeY/On83EX0uOcpVMG4o=; 
	b=K7jBJ8Kbb6ilHDA4sKJyNS8MV3Xe42eXiFZzrUAIRSjPtQzWKETQTRrWmkSq6iuU7rN016i4f9q7vxdlJDW4x9WxizyP1U6RXX1ccrVJgk84CXAyyFZf0AZL4vfWyaphOnUlGQfkpCqg7DBLuyTYVhBLuBQtBVlGMjyTfCV/+YY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219199;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HdicsRgarBX2PfmY3asMS9OdeY/On83EX0uOcpVMG4o=;
	b=Ps2O1zd0Z50EgYZf7nIJ+98l1g4O5lWAI5iGy8ZANPh69YU2n4vWDMpCXqDDaLcS
	yKrLNnvNLu2Nhv5CMslRJg7o/D650s75DgslS0jsK/mm6qSedHYYVKx/gckuLSaG8ML
	fwB+0CILAj5a9M8Pjd/voQFJ/vehlj+VRWW4NcN+VihU86JPFMmwfpITgxbCq/KhdQO
	/wDkl0qQh+u0Npi7NgsUXnlKxpkgG2tZoo9hcKC8FbuaDXwusuqeQD5HLMXZj5kON7L
	ZtC34wDNuXYv97TLgDaPlJ8o/mDpB/8Ozwkk7F+SqCjSoHUSoKtzl3Vhy6lo63b+sOA
	7ZD8iwCWvA==
Received: by mx.zohomail.com with SMTPS id 177221919767957.845525955720746;
	Fri, 27 Feb 2026 11:06:37 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 3/9] leds: cros_ec: Implement offloaded() callback for trigger
Date: Sat, 28 Feb 2026 03:06:00 +0800
Message-ID: <20260227190617.271388-4-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

"chromeos-auto" is a private hw control trigger which always stays in hw
control mode. Implement offloaded() callback with its return value to be
always true to reflect this.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2d..f48e3cf6ccf68 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -86,12 +86,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.offloaded = cros_ec_led_trigger_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
-- 
2.51.0

