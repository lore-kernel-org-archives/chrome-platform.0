Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154CC3BB2A
	for <chrome-platform@lists.linux.dev>; Sat, 10 Feb 2024 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707549010; cv=none; b=bvkd+2jmVVl8V/eCdRQvG72bJ+0+pj6v+cCS9WkoT2Y7aKVs+c17iPyb+tRz1bSivQNaQbP5pIB4qZd4C+msT34E9wdvc0i+0ecRR4o2aQZSpENtd32soDe08icwFbP8CEo9ZrP/3EeQMcwBPiTSO8iG8c8YB7Ly+DTuo0CLQY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707549010; c=relaxed/simple;
	bh=EG0cKUa80lUC/mdhsPXkhNNLPHcQfpDmZUDBjhurXzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJyhlaS/J/rpefsIsraP0Rzb/0O1pX0TGOwe3NO7GZhulhpdGazQXymBsTzQA3u2oijnKy2em67ZDIsBF42+/5WmfxgUaz3Oq0nN0s4TCyp7QsjtR3Ir+5sV49GzS9le3QB+tV1iD5nkbi6eDdC1l80az3NW2XOylhZUqLU/yBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eH2sbbo+; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eH2sbbo+"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bfd40ff56fso739114b6e.2
        for <chrome-platform@lists.linux.dev>; Fri, 09 Feb 2024 23:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707549007; x=1708153807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6V0amUOjUWvw6MQgN3h/VqwRga/J7+mYEIAgmrb0/c=;
        b=eH2sbbo+hZa4QiTP3vIUnb0On5to+DpmDIgbs8UezwceYVXTIGU/HBe+UELynZRLqy
         jEFzBejenP8cAl0B6MTi3w+BEC0xD/TLrsxAZKuuk6+CvZW83CUoyVwYt7Bo8HEmDk6K
         e8YQHJiS+R9uUhw8CVGi5/zzN9n0lWLz0C1wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707549007; x=1708153807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6V0amUOjUWvw6MQgN3h/VqwRga/J7+mYEIAgmrb0/c=;
        b=IA40GQNUe9mCA+8LvkoFrCZI37GxiZi3LqkiJelLS6B77nvyL/jov4yt5Ef2cRqF+1
         Zw3Y2r0JwGL5lMf0aFrT9F79zetO8/C2PHwTRtB9xKL9SSVyCEXB4ADnLsUSmstkPGOu
         vv91gC1jGPvKjnRwD+qDekofktt8BlRyMN1xgsG29XuCvf2hDTs4qvusDl3d44tVkqIj
         UYW2L2ybrklmghKCd4ULLGUdYi2TrkfdBz/r0IxHUomHqGN1h8LjxJ5a15DVDrDKlBXA
         BVbzSszoNM6UjscewN0KIcETSSUKLVWR7gvZslRbR24Jd3t5Yi2doX32MTjzdj2PauwN
         rwkg==
X-Gm-Message-State: AOJu0YyQ7gkuToJLV8yBgtI4lJbot5A9499l8nFEVkNsmqmFVugwUWb0
	2mDLZhKeoIdIk0n0Zydmu9MkbHrC970mqfLJRXucAxzehVVQqIPBtOPSoJQiiCDUkRjpWbaEwe4
	=
X-Google-Smtp-Source: AGHT+IEPZGcB81339CtNUM+V5udmB8I/bETFsZaMWv7WGBJDSGtks0RnM4TRys6niXWr5tY5R4dkQA==
X-Received: by 2002:a05:6358:33a5:b0:178:94bc:72f1 with SMTP id i37-20020a05635833a500b0017894bc72f1mr2096204rwd.22.1707549006715;
        Fri, 09 Feb 2024 23:10:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaLSbKYBfB1kta5BCH5EdLApsxMVyPshOqjiQkEGr1RgU09aCNI7J26PA5y6zB52NocFHPNEZcSqExxzEebPG0kVUARyga8iDavpXgO/KXj20AkjZcB7wdsTX1/URZ2Nur6K2cfRUMcMqxIorJHw4CLpKd98bgpdp3nq0wUCa3LZzrKJVnVn10AIP2QIsykTSet7oZaAoJxUbbOPTk6nl2OQS0uBX0yVVG6x7OyBWN+x2TGSPTlG+d3mtxW22pMdHjnxeFjLBP9FoLjOJcpjpoBIoDVEv7UUdvnBICbxgiDOO/v3HZVimalG+xqyrgCAwkwHxZ6TDG4Ak651HwlJTFEu+Jah1s+9B9qu0tLmRn08YMO+1n1A==
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id p6-20020a625b06000000b006db05eb1301sm1726988pfb.21.2024.02.09.23.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:10:06 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 16/22] platform/chrome: cros_typec_switch: Support orientation-switch
Date: Fri,  9 Feb 2024 23:09:27 -0800
Message-ID: <20240210070934.2549994-17-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register an orientation switch with the typec subsystem when the
'orientation-switch' DT property is present. In these sorts of hardware
designs, the DP phy lanes are wired directly to the usb-c-connector. The
EC signals entry and exit of DP mode on the port, and the DP phy lanes
are assigned to the pins based on the port orientation (normal or
reverse).

Stash the orientation of the port and simply wait for the atomic_check
phase to request the desired DP lane assignment (normal or reverse).
Don't restrict this to the presence of the mode-switch property because
it's possible for this device to only be an orientation-switch, in which
case the DP mode entry is signaled externally (e.g. through an HPD pin
on the DP source).

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 84 ++++++++++++++++++---
 1 file changed, 72 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index adcbf8f44c98..c22c2531327a 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -38,9 +38,11 @@ struct cros_typec_dp_bridge {
 struct cros_typec_port {
 	int port_num;
 	struct typec_mux_dev *mode_switch;
+	struct typec_switch_dev *orientation_switch;
 	struct typec_retimer *retimer;
 	size_t num_dp_lanes;
 	u32 lane_mapping[USBC_LANES_COUNT];
+	enum typec_orientation orientation;
 	struct cros_typec_switch_data *sdata;
 };
 
@@ -245,6 +247,21 @@ static int cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch,
 	return 0;
 }
 
+static int cros_typec_dp_port_orientation_set(struct typec_switch_dev *sw,
+					      enum typec_orientation orientation)
+{
+	struct cros_typec_port *port = typec_switch_get_drvdata(sw);
+
+	/*
+	 * Lane remapping is in cros_typec_dp_bridge_atomic_check(). Whenever
+	 * an orientation changes HPD will go low and then high again so the
+	 * atomic check handles the orientation change.
+	 */
+	port->orientation = orientation;
+
+	return 0;
+}
+
 static int cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
 	struct cros_typec_port *port = typec_retimer_get_drvdata(retimer);
@@ -280,6 +297,21 @@ static int cros_typec_register_mode_switch(struct cros_typec_port *port,
 	return PTR_ERR_OR_ZERO(port->mode_switch);
 }
 
+static int cros_typec_register_orientation_switch(struct cros_typec_port *port,
+						  struct fwnode_handle *fwnode)
+{
+	struct typec_switch_desc orientation_switch_desc = {
+		.fwnode = fwnode,
+		.drvdata = port,
+		.name = fwnode_get_name(fwnode),
+		.set = cros_typec_dp_port_orientation_set,
+	};
+
+	port->orientation_switch = typec_switch_register(port->sdata->dev, &orientation_switch_desc);
+
+	return PTR_ERR_OR_ZERO(port->orientation_switch);
+}
+
 static int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
 {
 	struct typec_retimer_desc retimer_desc = {
@@ -328,17 +360,35 @@ static int dp_lane_to_typec_lane(unsigned int dp_lane)
 	return -EINVAL;
 }
 
-static int typec_to_dp_lane(unsigned int typec_lane)
+static int typec_to_dp_lane(unsigned int typec_lane,
+			    enum typec_orientation orientation)
 {
-	switch (typec_lane) {
-	case 0:
-		return 3;
-	case 1:
-		return 2;
-	case 2:
-		return 0;
-	case 3:
-		return 1;
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NONE:
+	case TYPEC_ORIENTATION_NORMAL:
+		switch (typec_lane) {
+		case 0:
+			return 3;
+		case 1:
+			return 2;
+		case 2:
+			return 0;
+		case 3:
+			return 1;
+		}
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		switch (typec_lane) {
+		case 0:
+			return 0;
+		case 1:
+			return 1;
+		case 2:
+			return 3;
+		case 3:
+			return 2;
+		}
+		break;
 	}
 
 	return -EINVAL;
@@ -381,7 +431,7 @@ static int cros_typec_dp_bridge_atomic_check(struct drm_bridge *bridge,
 		typec_lane = port->lane_mapping[typec_lane];
 
 		/* Map logical type-c lane to logical DP lane */
-		in_lanes[i].logical = typec_to_dp_lane(typec_lane);
+		in_lanes[i].logical = typec_to_dp_lane(typec_lane, port->orientation);
 	}
 
 	return 0;
@@ -509,6 +559,15 @@ static int cros_typec_register_port(struct cros_typec_switch_data *sdata,
 		dev_dbg(dev, "Mode switch registered for index %u\n", index);
 	}
 
+	if (fwnode_property_present(fwnode, "orientation-switch")) {
+		ret = cros_typec_register_orientation_switch(port, port_node);
+		if (ret) {
+			dev_err(dev, "Orientation switch register failed\n");
+			goto out;
+		}
+
+		dev_dbg(dev, "Orientation switch registered for index %u\n", index);
+	}
 
 out:
 	if (np)
@@ -556,7 +615,8 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 		}
 	}
 
-	if (fwnode_property_present(devnode, "mode-switch")) {
+	if (fwnode_property_present(devnode, "mode-switch") ||
+	    fwnode_property_present(devnode, "orientation-switch")) {
 		fwnode = fwnode_graph_get_endpoint_by_id(devnode, 0, 0, 0);
 		if (fwnode) {
 			ret = cros_typec_register_dp_bridge(sdata, fwnode);
-- 
https://chromeos.dev

