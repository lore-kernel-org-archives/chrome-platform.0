Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A592C237E;
	Thu, 18 Jun 2026 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757338; cv=none; b=DDTBZ5I1Oo/6ug9URfFJ+3V5omgcsiHJsq3+U0QZb5TKch0L6i7IbjgF62+m1gWWC2uUt1no+CsWPHutJtuJLvTDMt5WjFdXHEkGSJb13W5/GxDjnMFgvAUzoBHrXk7zg2u8vC8GlmmwJDTBz+PJeoEKIMAC/FVjQJGHMsHKAwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757338; c=relaxed/simple;
	bh=uJlDktV+QiCQ4pwu+QvEWro7us+HTsFXyZG//rPtT10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY/A/KJ0pmGrKN+I7IgRDVKhe8cPxjJfo+DZnhFm3P+PxyD4XFfhGwO3WBou2BYAthdObVIGOuWVH2q+BlIMngzd0OnPwcW7LKL8lmW0P2IgFan1rle6uYB/Dnv50mfBhF/Fs5rdpJNA88/YG4eJFHHeRsqKyJC/V8n4KljmV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEmolO51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEmolO51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21C31F000E9;
	Thu, 18 Jun 2026 04:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781757337;
	bh=vJXxokcD+4DH1yxA/U9XMWiG8AoaaDeGQhbNha3ku2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEmolO51R9vfptlZfyg6B8PlDCkfF+K2+mweDmiZP816rtndo4HIIX2UNZZgx5nzj
	 NY6GphLSRQbOdXNPkY179pY47b0NvVIqeTAc5PHIvliYhIhiC3pFYI/zh5/TK1Ceak
	 /ovXrZkdIBnG6d79BLVr5TkPfd8e0D6UFs9M+ZCZtl/wFBF5jGBH+uQyxdLElhzGZI
	 4cxwB0qvGlZZfx4aQhVRVEbE6LIfeS5Xeh8ntqQQI64rG+ZATLP2zFaan6Wo/zq3Lc
	 oZ1XR1vJ0wfZC2AoQkRqKL2hu+e8Jgth2q34MkVoGMLOVDf1/TOLByOg9pc4YCSFvK
	 /bGLDrM4jaOXQ==
Date: Thu, 18 Jun 2026 04:35:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: hexlabsecurity@proton.me
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v2] platform/chrome: sensorhub: bound the EC-reported
 sensor number
Message-ID: <ajN1liwdJz30CNzz@google.com>
References: <20260617-b4-disp-4e176cdc-v2-1-160f9ffa463e@proton.me>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-b4-disp-4e176cdc-v2-1-160f9ffa463e@proton.me>

On Wed, Jun 17, 2026 at 12:42:27AM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> Each EC FIFO event carries a sensor number (in->sensor_num, an 8-bit
> value). cros_ec_sensorhub_ring_handler() validates the FIFO event count,
> the per-read count and the ring bound, but not the per-event sensor
> number. cros_ec_sensor_ring_process_event() then uses it unchecked to
> index sensorhub->batch_state[], which is allocated with only
> sensorhub->sensor_num entries, so a sensor number of sensor_num or larger
> is an out-of-bounds read and write of batch_state[] - in the ODR and
> FLUSH paths and, via cros_ec_sensor_ring_check_for_past_timestamp(), as
> an out-of-bounds read that is fed back into the event timestamp.
> 
> Validate the sensor number in the ring handler, where each event is read
> from the EC, and drop a malformed event before it is used. This is the
> bound cros_sensorhub_send_sample() already applies on the push path,
> hoisted to the point where the EC data enters the kernel so it also
> covers the batch_state[] indexing in cros_ec_sensor_ring_process_event()
> and sensor_mask |= BIT(in->sensor_num) in the handler.
> 
> Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>

I'd trim the commit message and use:
Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")

For my reference,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
