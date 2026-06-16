Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116383A9D84;
	Tue, 16 Jun 2026 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602978; cv=none; b=kTsI9TkgLsbtLdiQRemJFTMunvgRbOpkq+00LLdu2l1eyZEluKcK++t6sZvlaTJLyDkORoAaquc/QKjVyG/Xg66cJLDYl2tVQvbgYmvPDRC4YuHIvujnW99jP4Nv3zom9M01WaFIpuIQjbZONCu8X+GYKszAGhYVKBsfoL1nzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602978; c=relaxed/simple;
	bh=KON5wHVP2dusjIEEpTrY92goureBXgOqa2a8cKJPju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDRbSENuEq9VoihqBInSxbe0HQzf4hgdZJ2oEVxKOpbvp73kL0tdRigVwovZA9b+WKnGyxl8NoaypcuuuJwDM9aVikAUutLlgmzAAN00bDN02eb25cVxJ1MG+7z1eh+Pw/O4enYYTsITWysCMpsIlMN81LSQ/rWKXUseS0Q+aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLXA5uat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLXA5uat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02F61F000E9;
	Tue, 16 Jun 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781602976;
	bh=nGNdnygg6ESv2hn8tUMbIAbovlxYuywE/Ztvj/Jywq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLXA5uatj5rNNWslMVvKbZ+rQhAOXhmf+uD5fejGQ3zQOSzyoyTLxF70TUG3hOga9
	 F4QoNZYKPyPFcUruLTSZPNXMZPM1GBmKo8ZApInS8ms+9+IC7rhL2C/MqyMQgAJ05C
	 62PhE7/HstDoZyorCedK0yrABEVI8zZ8SK4vCKuTfWLNvnXnirJIWjKqAoHsnLA14L
	 tC7EQqF5jBzP6B8A67fvrkjEk0nhrHnCFZjkOcEGTpnpk9FLRE7/fAvCVek4mfju/r
	 fv0motLgB5UO5oOKaGkAyb6E/vZneV7EEY5cpGhxcNY8ANj+nMClWZJ+NzVWLAEtIk
	 IxiTR6Sd7n70Q==
Date: Tue, 16 Jun 2026 09:42:53 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: hexlabsecurity@proton.me
Cc: Benson Leung <bleung@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: sensorhub: bound the EC-reported sensor
 number
Message-ID: <ajEanbRM75GASMmj@google.com>
References: <20260615-b4-disp-42d17651-v1-1-fe599bb972f4@proton.me>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-b4-disp-42d17651-v1-1-fe599bb972f4@proton.me>

On Mon, Jun 15, 2026 at 11:46:34PM -0500, Bryam Vargas via B4 Relay wrote:
> cros_ec_sensorhub_ring_handler() validates the FIFO event count and the
> ring bound, but not the per-event sensor number, so a value of
> sensor_num or larger results in an out-of-bounds read and write of the
> batch_state array - directly here and, via
> cros_ec_sensor_ring_check_for_past_timestamp(), as an out-of-bounds read
> that is fed back into the event timestamp.

Good catch.  The validation for `in->sensor_num` should ideally be done
earlier in cros_ec_sensorhub_ring_handler()[1], which is where the data is
read from the EC.  This catches the invalid sensor number at the source.

[1] https://elixir.bootlin.com/linux/v7.1/source/drivers/platform/chrome/cros_ec_sensorhub_ring.c#L892

> The push path cros_sensorhub_send_sample() already rejects a sensor
> number that is not smaller than sensor_num; apply the same check in the
> ring processing path and drop the malformed event.

If the check is added to cros_ec_sensorhub_ring_handler(), the existing
check in cros_sensorhub_send_sample() becomes redundant, as the sensor
number has already been validated.

> 
> Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")

The out-of-bounds issue seems more fundamentally related to 145d59baff59
("platform/chrome: cros_ec_sensorhub: Add FIFO support").

> @@ -436,6 +436,20 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
>  	const s64 now = cros_ec_get_time_ns();
>  	int axis, async_flags;
>  
> +	/*
> +	 * The sensor number is reported by the EC and is used unchecked below
> +	 * to index sensorhub->batch_state[], which is only sensor_num entries
> +	 * long. Reject an out-of-range value, as cros_sensorhub_send_sample()
> +	 * already does, so a malformed FIFO event cannot drive an out-of-bounds
> +	 * access.
> +	 */

It's a bit verbose.  Something more concise like "Skip event if sensor_num
from EC is out of bounds." would be sufficient.

> +	if (in->sensor_num >= sensorhub->sensor_num) {
> +		dev_warn_ratelimited(sensorhub->dev,
> +				     "Invalid sensor number %u from EC\n",
> +				     in->sensor_num);
> +		return false;
> +	}

As mentioned, this check would be better placed in
cros_ec_sensorhub_ring_handler().
