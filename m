Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90027C
	for <chrome-platform@lists.linux.dev>; Sat,  1 Apr 2023 01:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B6FC433D2;
	Sat,  1 Apr 2023 01:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680313474;
	bh=OWsC+RlSBWRoNvougj80y3T8tX3mx0IkRNMcosEg6mo=;
	h=From:To:Cc:Subject:Date:From;
	b=iM56e0OE4WX3bMMJEAp6Nj67Q0Hcf/6tkwhGFbH76cuwE3rmLeOI2yRNZx6XR0Rp3
	 umhIWuDn5iE/+3QIYlYBxD0El3PQvXqhZUKMZScSs1qZA/KAfKYC7JHCXbUYt/yUWL
	 cJx4rNO/87hE6eI/NxAhn/CtwCGz1nI5DOmhkYrT2vLF1RhMpFq1Kkk0CJSXd+95s+
	 qR5ls8fr2Nd1/HFxnQKMpIxcHyqU0z9Xab4XSs6KsFKUVYvq5iX9gQG/ivT61IhEUv
	 sFsLj+kFJ4qMoQ0Eqtqapcrt0QTKCp8y8K5cRGh3tvUQbOiqYD2E4yPBcvxK8pznP1
	 7OTNxz88H5FnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Grant Grundler <grundler@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	sre@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/6] power: supply: cros_usbpd: reclassify "default case!" as debug
Date: Fri, 31 Mar 2023 21:44:26 -0400
Message-Id: <20230401014431.3357345-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Grant Grundler <grundler@chromium.org>

[ Upstream commit 14c76b2e75bca4d96e2b85a0c12aa43e84fe3f74 ]

This doesn't need to be printed every second as an error:
...
<3>[17438.628385] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
<3>[17439.634176] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
<3>[17440.640298] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
...

Reduce priority from ERROR to DEBUG.

Signed-off-by: Grant Grundler <grundler@chromium.org>
Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/power/supply/cros_usbpd-charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 6cc7c3910e098..0f80fdf88253c 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -282,7 +282,7 @@ static int cros_usbpd_charger_get_power_info(struct port_data *port)
 		port->psy_current_max = 0;
 		break;
 	default:
-		dev_err(dev, "Port %d: default case!\n", port->port_number);
+		dev_dbg(dev, "Port %d: default case!\n", port->port_number);
 		port->psy_usb_type = POWER_SUPPLY_USB_TYPE_SDP;
 	}
 
-- 
2.39.2

