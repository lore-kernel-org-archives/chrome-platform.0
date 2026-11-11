Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405737;
	b=owWmgMiRqrPj2kJ3+v7LdnF+6Yqzve/7V9LYVIU5ZHPTRLJxaXi8HxGnfg2o4KlU/YxU
	 xcc8nyxt+pTL4Y7CbN8Iz0Qlg+IJi9jzwAnVSBKE+DDuLBkchbrv+aFftmzzMIxMk6/+3
	 Vq7e+k7Yelwo2VpMM+1oWoECX3poHL+kfRzfSNVfhdmP+8xeS+Mz2HVZopAm6a5kVzeCS
	 M5E0ymmLbK71eqxyDSRV902ddVKDmQS6C9KRR2p0NDGbVyrt5oZQTqthq/hMaypD9P4Ok
	 AzyjoO/28n5xl3Y/CEAnlMlw+2U1nnK/aDavK/DfWHNspSZu/gUcV4jB+DlsPU1rG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405737;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l00vkickO7MnEi9PApV4N1wdqkAICuo/T6F5TR0Wl7g=;
	b=s9N3+aKI+Su2GlsUx/1thtCfjOUNsnAZMaHltwf2LQETRXco2UxHqluAtRBSWpOuabsZ
	 q/i8LDC80/qoUuPxmAewI7t7s7ipoK17K25mPAiOseF7xuBy6wDJYn4JtGioubeaUBq8o
	 CNPDUqhbbSAL+I5CrxDHOLqpuaHzDwpaswxyWcJ8zLziQNeYMBWHMsSrR9UrE+I388G/j
	 A4yamEb+9VPEv6ZFcrEIkrMHtBuiyZTH9xjxA2lt1m/tELxIBa51qB43//1KBxvl3WtMu
	 SENWlw3/kAQ3ceHmcM9CdV7SLKS9lEs4JEwa4H6mgQ1DXE2gm5gTh7NZah4lnKrqCLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ye5TXOIE;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47482606A321
	for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 14:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47482606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ye5TXOIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794405732; x=1794664932;
	bh=l00vkickO7MnEi9PApV4N1wdqkAICuo/T6F5TR0Wl7g=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ye5TXOIEF9AGXuuLCH+rhhds/xsxETMhSKu33C2IAtQniG2oA5nxroqdG+1gnM8rQ
	 R8PUxQWdEeuxY0eJ50BlfIRZxXEQPib8WMwLRA+BE8iHMVuCbMHYQ5kJT5TgsXG9ec
	 TwZaK31CVOvUCNYlfWTQJrT2+1rfFIaAz524/enQDlT5785HgDWjajr5hS8yOHO3Se
	 z4GF3PFBIr3rXWPCC07ODJAtZh8ryKI3e7Tdjx6dlPMXBhuVVxhF9Yq6bRQAmnBGl4
	 JihzFPdcvNIGBKUcPl36x0vn4ET4ufribGS44IpJgrY1pv4h6adP3Q32HO5dre6ZmE
	 87+G/fVo0tHyQ==
Date: Wed, 11 Nov 2026 14:02:09 +0000
To: "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>
From: beardedtechwizard <beardedtechwizard@protonmail.com>
Subject: [PATCH] mfd: cros_ec: Don't abort probe on -EOPNOTSUPP from GET_FEATURES
Message-ID: <hQEGbKxcpoe707VrIrPkgUiFwcIdxHKUXSAwVg0k5ppyHFPa9RrZXrwkKIdgji2EqMc_0LARMGKJhh1Co9TAHhlflydCWQxkYRaFB7u3bc8=@protonmail.com>
Feedback-ID: 36656562:user:proton
X-Pm-Message-ID: 1766e484e6870510e0259fbccd929d5b24d00b00
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch that made cros_ec_read_features() a hard failure during
ec_device_probe() breaks older ECs that don't implement
EC_CMD_GET_FEATURES. The error -95 (-EOPNOTSUPP) is not a transfer
failure; it means the EC predates the command.

Before the patch, the code handled this gracefully:

    if (ret < 0) {
        dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
        memset(features, 0, sizeof(*features));
    }

The new code replaces this with a hard goto failed, which aborts the
entire MFD probe. Result: no cros_ec_chardev, no /dev/cros_ec, no
cros_ec_sysfs, no cros_ec_hwmon. All userspace EC tooling (ectool,
fw-ectool, cros-usbpd) breaks.

Reproduced on:
  Kernel: 7.3.3-100.fc43.x86_64 (Fedora 43)
  dmesg:
    cros_ec_lpcs GOOG0004:00: Chrome EC device registered
    cros-ec-dev cros-ec-dev.2.auto: cannot get EC features: -95
    cros-ec-dev cros-ec-dev.2.auto: probe with driver cros-ec-dev
      failed with error -95

The fix is to treat -EOPNOTSUPP as "no features, continue" and only
abort on actual transfer errors:

--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -207,7 +207,7 @@ static int ec_device_probe(struct platform_device *pdev=
)
 =09retval =3D cros_ec_read_features(ec);
-=09if (retval < 0)
+=09if (retval < 0 && retval !=3D -EOPNOTSUPP)
 =09=09goto failed;

This preserves the original intent of the patch (abort on dead EC /
transfer failure) while retaining the compat shim for older ECs.

Tested: with this patch, cros_ec_dev probes successfully on an EC that
returns -EOPNOTSUPP for GET_FEATURES. All MFD subdevices register,
/dev/cros_ec appears, and ectool --interface=3Ddev works.


