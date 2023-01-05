Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F828494
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 13:25:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9so22566764pll.9
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 05:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
        b=aff45gLxfSUOPSf+P16Wfqefq4B3AAiek2pWrvQRllMjMCQXDmLrCJ016EujGWaX3q
         EdlF/dam+lvnc2QOWICQbuXZrYWTm5byyAE0km3RStxK4OycVexOKmH7kuQXq9xCD7ZL
         73HASPzrpoidvfOf6UuW6Dexj/RgPR2Glgkm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbxRbyImpevpLcgNpmQRY5xjXofgzVP7nhTUY2hiItA=;
        b=SJ3olxTiY4hlzlTGeuuW+RDQyTwhQUCUrnhD0Z/bfFtU/dsAx/B1Yfz1mtIn6JWpqA
         HITlEkXvb1PaY7EFkyADEGSYH/QfXNpbsdbXWXwDtebWk9w5RiwXk98GBELC7jwPu02H
         BQrYZo6C0M2QHi0/JsYsfJMQISW++EBt7Wd5jKkPGoBfCSD6SnMUqnNUlNaoW4I3ufFz
         G6NiFTgDcomizyM/acmU8YJXfPd7kZr7j9w6lSnS0LrvGDD0eCWLMkOI/vX0ZynM9/6u
         gbBC9iTuDGT+cGTThe1eyjKog37IgHYkIfCg+uLjeDfNpfdd0oidUB342KbIKUo9dfNC
         SAQg==
X-Gm-Message-State: AFqh2kprt1tcIJiuV6qoLZjxIWcYzk0Rq9pw+L0/+GscCz+RkRvUdz5p
	jwX1eLB0QaQW+HMsPBBgg9eDXg==
X-Google-Smtp-Source: AMrXdXtNIhm1zRqPAeWmXv09/1S9tpXOtiiTUYV1OphcKK5xQL/pBpTem6Md/SpDKiVfYtS+hZxHTQ==
X-Received: by 2002:a17:90a:f2d4:b0:21a:b64:3488 with SMTP id gt20-20020a17090af2d400b0021a0b643488mr54462147pjb.44.1672925114268;
        Thu, 05 Jan 2023 05:25:14 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
        by smtp.gmail.com with ESMTPSA id gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:25:13 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Xin Ji <xji@analogixsemi.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>,
	linux-acpi@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v7 1/9] device property: Add remote endpoint to devcon matcher
Date: Thu,  5 Jan 2023 21:24:49 +0800
Message-Id: <20230105132457.4125372-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105132457.4125372-1-treapking@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Prashant Malani <pmalani@chromium.org>

When searching the device graph for device matches, check the
remote-endpoint itself for a match.

Some drivers register devices for individual endpoints. This allows
the matcher code to evaluate those for a match too, instead
of only looking at the remote parent devices. This is required when a
device supports two mode switches in its endpoints, so we can't simply
register the mode switch with the parent node.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v6)

Changes in v6:
- New in v6

 drivers/base/property.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 2a5a37fcd998..48877af4e444 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1223,6 +1223,21 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
 			break;
 		}
 
+		/*
+		 * Some drivers may register devices for endpoints. Check
+		 * the remote-endpoints for matches in addition to the remote
+		 * port parent.
+		 */
+		node = fwnode_graph_get_remote_endpoint(ep);
+		if (fwnode_device_is_available(node)) {
+			ret = match(node, con_id, data);
+			if (ret) {
+				if (matches)
+					matches[count] = ret;
+				count++;
+			}
+		}
+
 		node = fwnode_graph_get_remote_port_parent(ep);
 		if (!fwnode_device_is_available(node)) {
 			fwnode_handle_put(node);
-- 
2.39.0.314.g84b9a713c41-goog

