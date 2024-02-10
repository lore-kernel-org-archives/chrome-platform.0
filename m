Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6B39852
	for <chrome-platform@lists.linux.dev>; Sat, 10 Feb 2024 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548997; cv=none; b=stPXvYtGA8l2a24PaWuy2DznLv3Ceaih7Yv2lvtLyv9t0Ye4xmqyuMv/Nl1Xmdx1jBDybaDBhKlaoxCarVEaQ9amIA55y3NFgPQEe5umvIKbuLa+lVXF91bFyWzR5O0R+N0zRRJlv51bPDq5P4BgYXeMRAOLrS6pgKeJ/0BB6gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548997; c=relaxed/simple;
	bh=ZrfWbNRvVHxNeML0mxoQMrfj5rYIPsgYNkk8cvKEzno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0dP98KU/p+yQkkaHrMO3sZR9c2u6P2egXv/xit6E2ykYrTMIKPBxXT/woOHBJ5RKOFE1RLFYCXB9hoCQtGBr3vMakAZV05GUadppjQlWst197rL23rSr1A/I3TLbFg3W0f4TPG+TLrSwYj33o/UruEEBfhzb201Q6nv9Lp6WIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DSws7Cty; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DSws7Cty"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c66b093b86so1934196a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 09 Feb 2024 23:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548994; x=1708153794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hZ7H2Ratg3rpkz8VVpxhu5TODDBGSfCSSbP4Wfsjkw=;
        b=DSws7CtyjAF0hF742siFkaKnD2jmyTxdhQjurMipyR9fGVZLryX+9NpGAXmVulNT0i
         Ng5/b7RjR04bbgLbv4mzJM7uIDzot656QaT+6loYJMRWSj3nvfpgYPYLpKWxWpfr0/Bo
         csYINScA5K7ebFJnZhe4qYpNOGYXABvtoKWg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548994; x=1708153794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hZ7H2Ratg3rpkz8VVpxhu5TODDBGSfCSSbP4Wfsjkw=;
        b=mzIfyR8r+sz3fqKTGjRz6/UUmODXZm+czOSzIlUoWtItgPtEx5N42D4kDoR3/pRXZx
         g/HDPz6ikFypDQ9RPkmfZ4KiFA/3fnSIgBJ10neyifBc+CYfwtHwAi7bVFz2iNocIY5a
         nksGfikA41DZAd1nxhnUnStcsdrQc5HfCGs8A/IAwuwmMoDnF3/0dJPv7tGzenAoAeH6
         +4WpaJnyNub4NUbLg7VuP4lt87cAFvRMaUHfv8VsOWKPku+xiClh47b+1Gz+NbpDCxaR
         pjUFfgVfJ5CurcUobCFjuxNOURIKZiV83uW5NUIr1PZF284eJJWf3oeKUm4x+9yqG/xd
         gzKw==
X-Gm-Message-State: AOJu0Yx6Mj8bMNK6iwCBtk9JucEwMb4LVYcqF17d5n5lZE5xustREJhO
	ADQ+2gKAawzRcjeJL+nLzyxwSLDGiiNVojv4AwCjzspfR5NfETdZzGfPQkGAzH1tZq8n8FzfuX8
	=
X-Google-Smtp-Source: AGHT+IE74shzX34A4XJ2sswnIPnBB2cAtBVGC7VAOSCbWKlPiKiVqbqmig4A0vzOlWVgJfSyoFJIVQ==
X-Received: by 2002:a17:90a:b881:b0:296:1dcf:c297 with SMTP id o1-20020a17090ab88100b002961dcfc297mr2038853pjr.7.1707548993706;
        Fri, 09 Feb 2024 23:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdlXLg5og70qheFVtE2wxLh4Aatgr2JuX6qBZq1Hzv0Ubz4IIv0qIg/xzMHN8EPeDldrbsRJa3EkSGd6FVIRCmDYEQU7VCTD8/9qn7/J/564Dc7YbBVXVx8GJprDInmAOehoOK4VzXaKKoWRxaJ9KfPxwEMKT1MC/9v0Ff2/2IkDw/oc//N8Zhp/aQ9VKlfE9UkS6Fnijj/S/phDX7qkp3imWWVKdocEDgtZlC6S+PFY5tMBwxIIWO0DQuvwakgIw9Pkiw/m0OR/Tf5UowBvq5FMaYjhtiX49jof2ZrCDRMUIVmH2SxGcFfvixC1irDXKWqyJ53IAG89qM3wqEcRJLc02ftkUhCV6aUZ61aFJk5a0i04AG+zB5QHE/mrdyixBvB6qRjd12JpR5l31MK1K3O7ZL3/hK0ZUFt2faCzREy/6eMaNZdEBQGEQTB2U+LRYjZEQ=
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id bj13-20020a17090b088d00b0029552a03219sm2883297pjb.29.2024.02.09.23.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:09:53 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 08/22] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Fri,  9 Feb 2024 23:09:19 -0800
Message-ID: <20240210070934.2549994-9-swboyd@chromium.org>
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

From: Prashant Malani <pmalani@chromium.org>

When using OF graph, the fw_devlink code will create links between the
individual port driver (cros-ec-typec here) and the parent device for
a Type-C switch (like mode-switch). Since the mode-switch will in turn
have the usb-c-connector (i.e the child of the port driver) as a
supplier, fw_devlink will not be able to resolve the cyclic dependency
correctly.

As a result, the mode-switch driver probe() never runs, so mode-switches
are never registered. Because of that, the port driver probe constantly
fails with -EPROBE_DEFER, because the Type-C connector class requires all
switch devices to be registered prior to port registration.

To break this deadlock and allow the mode-switch registration to occur,
purge all the usb-c-connector nodes' absent suppliers. This eliminates
the connector as a supplier for a switch and allows it to be probed.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Link: https://lore.kernel.org/r/20230331091145.737305-3-treapking@chromium.org
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2b2f14a1b711..cc5269a4b2f1 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -325,6 +325,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		return -EINVAL;
 	}
 
+	/*
+	 * OF graph may have set up some device links with switches,
+	 * since connectors have their own compatible. Purge these
+	 * to avoid a deadlock in switch probe (the switch mistakenly
+	 * assumes the connector is a supplier).
+	 */
+	if (dev_of_node(dev))
+		device_for_each_child_node(dev, fwnode)
+			fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
-- 
https://chromeos.dev

