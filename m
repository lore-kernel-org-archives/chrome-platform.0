Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7B23A9
	for <chrome-platform@lists.linux.dev>; Sat,  4 Feb 2023 13:30:57 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id t17so5570555pfj.0
        for <chrome-platform@lists.linux.dev>; Sat, 04 Feb 2023 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9iPc9yhVkUofB90tWrcvmiWB1xZN7L6aBmsKjdgh6c=;
        b=MmH3x/xM62zRTISXSedEvzRlaMSI+F8Qma5UmquaxSwlvv6YsPZ+8h1xP3F7M3D1Df
         QCXfWhoJOdvLdzh0hNXPqpam40tk12C8NpO5zRmImK/NmNXbcxJ9dSbO/w8oKgfe20ZG
         QRCqSAG2eCerNb0ZmsoC546f3eCSx0931M3tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9iPc9yhVkUofB90tWrcvmiWB1xZN7L6aBmsKjdgh6c=;
        b=XfYKeanmJ67d9y0/+oO9P7IJ/RI0JiFBt/we89X1OL5l+tMilPmO5+rCrfAQAPF7GU
         D9XgeS/GBxda6Cb6ycDABzmd/LwFfHzuvuoGRoZRJghN9u06NniViEscgOqE4nFAxb2t
         ttL54Wm+HTGUF5A6rQi8qJ576rECufASRI7rTF92dl4mcyUhyAibkijvpw12rO8oEfeA
         Q6uFsAx6d/rYxPAIYThtfYEigEKCpg8Y5yqGZ7n90bUlYIgYeYqemVi6p52ga0JFbGhW
         BYtr/7JBIq0aj49QYo+YPfZ2akvQv4ysrH9u1d5Edd8huQOyyrt2nxey1OqSRsrPUgRy
         3bzg==
X-Gm-Message-State: AO0yUKUg0kP4h02UXKaOU9eQ6wAwpBqPo4S+WxA/UY7t0VJbE3U8NZT1
	+D8bC+MECx14UXioQM8jrZ/Njg==
X-Google-Smtp-Source: AK7set+L0bc/md7jnlp6ucsfNCGE/z+ghrSK5N+MS4DGPqmGcMvtPY/U7zbRRON1T5JI3CoL3plPaA==
X-Received: by 2002:a05:6a00:882:b0:593:96a2:d60a with SMTP id q2-20020a056a00088200b0059396a2d60amr18474657pfj.30.1675517456766;
        Sat, 04 Feb 2023 05:30:56 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
        by smtp.gmail.com with ESMTPSA id 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 05:30:56 -0800 (PST)
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
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Allen Chen <allen.chen@ite.com.tw>,
	Lyude Paul <lyude@redhat.com>,
	linux-acpi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	chrome-platform@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v11 1/9] device property: Add remote endpoint to devcon matcher
Date: Sat,  4 Feb 2023 21:30:32 +0800
Message-Id: <20230204133040.1236799-2-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v11:
- Added missing fwnode_handle_put in drivers/base/property.c

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v6:
- New in v6

 drivers/base/property.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 2a5a37fcd998..e6f915b72eb7 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1223,6 +1223,22 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
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
+		fwnode_handle_put(node);
+
 		node = fwnode_graph_get_remote_port_parent(ep);
 		if (!fwnode_device_is_available(node)) {
 			fwnode_handle_put(node);
-- 
2.39.1.519.gcb327c4b5f-goog

