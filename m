Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE542BC43;
	Thu, 13 Aug 2026 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603791; cv=none; b=tlVCsaL97MwMgFR2fOIakaJeEpnPX/rVGqmE83kfocDByovejppX3fDK1XhqiSrnozKJEf1k5oat6/b4RwR8ZbP1WaD7tYRbovyv8tBo+8J7G1sxae/U4n/8LMeIGFSYbpGgI3geOYf43nVJalxJl7IwMYYBBZrdxM6Z/712JpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603791; c=relaxed/simple;
	bh=FC2DF3TR4DqHsxIOvoDEdNcS5Msr0CBzB1B4IIR/2Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czOrhLtBCj/wLDYoShuq9VnByjg4ExnbYRSl1d+O1RGXrY74CPEClEszK7goDIU3ryZtWvSMxTnX5unsUGgwqgcJNIDF0MiQtTRXH1MEFpY2pP5w8XSGUb5uilEPVy7j7DAIcs9lifmrSTz5OenZa2CZUTSPnZiuv9dI7ql5Bhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSqUAb6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSqUAb6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7611F00A3A;
	Thu, 13 Aug 2026 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603789;
	bh=LZqDENMhAY+wsfhuhwmHm2HfjjNJxSJdj123XR+hHHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSqUAb6totKQcXyBDvIhTtFLwRZ0ClJxA/siG+vMREpFQe2kkibQASpLWkIl4jL49
	 HsBNhHvMhnEmsvdRtWhZ4mvGem5TgLDgDV8cCO3ml9sqqnCKkZN26ZkbKB+Esmza3L
	 hbDRgbtitiC7nyx6GIu/65zC2axeqxFad29ZwYkG6urSM7Ata/ByGpmNssQcNgoloP
	 bBdKJUmFS56WQgcDJwtUo+EOHQkqayZoVwzeDBU4Cmpq7e55JFdVRYEJ+ZhdIS1v8A
	 ksCxH+/4fqtilzivR3bZaIz4TIORYqoOp6oP1PN620Jki2NmZLeXS/3+nkzewLhyen
	 sDvHlDF+6S1yg==
Date: Thu, 13 Aug 2026 06:49:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, tomhughes@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Fix deferred response
 payload handling
Message-ID: <an1pCrNBRrmWapA7@google.com>
References: <CA+Dqm33ZN1aaL8ZH4SkbOhhmzGEbKSYwcSxEnS4ByiOt7uVN=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Dqm33ZN1aaL8ZH4SkbOhhmzGEbKSYwcSxEnS4ByiOt7uVN=w@mail.gmail.com>

On Mon, Aug 10, 2026 at 02:43:29PM -0700, Rob Barnes wrote:
> Subject: [PATCH] platform/chrome: cros_ec_proto: Fix deferred response
> payload handling

The subject shouldn't be here.

> ... Save and restore orig_msg
> fields (command, outsize, version) around the resend request to
> prevent unintended caller struct mutations. Update existing KUnit
> tests and add test cases for 4-byte and 16-byte response
> payloads.

They are somehow redundant; can be removed.

> -static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
> uint32_t *result)

./scripts/checkpatch.pl --strict:
    ERROR: patch seems to be corrupt (line wrapped?)
resulting in the patch can't be applied (accompanying with other corrupts).

> +static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
> +					struct cros_ec_command *orig_msg)

./scripts/checkpatch.pl --strict:
    CHECK: Alignment should match open parenthesis

> @@ -170,8 +170,28 @@ static int cros_ec_wait_until_complete(struct
> cros_ec_device *ec_dev, uint32_t *
>  			break;
>  		}
> 
> -		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> -			return ret;
> +		if (!(status->flags & EC_COMMS_STATUS_PROCESSING)) {
> +			/*
> +			 * If original command requested response payload, retrieve it via
> +			 * EC_CMD_RESEND_RESPONSE into orig_msg->data. Otherwise return 0
> +			 * for zero-payload commands.
> +			 */

How about exiting earlier if `orig_msg->insize` is 0?

> +			if (orig_msg->insize > 0) {
> +				uint32_t orig_cmd = orig_msg->command;
> +				uint32_t orig_outsize = orig_msg->outsize;
> +				uint32_t orig_version = orig_msg->version;

./scripts/checkpatch.pl --strict:
    CHECK: Prefer kernel type 'u32' over 'uint32_t'

> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c
...
> -static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
> +static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0bytes(struct
                                                                    ^
							       0byte?

> +static void cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes(struct
> kunit *test)
> +{
...
> +	memset(&buf, 0, sizeof(buf));
> +	msg->version = 1;
> +	msg->command = 0x1234;
> +	msg->outsize = 2;
> +	msg->insize = sizeof(buf.data);
...
> +	ret = cros_ec_cmd_xfer(ec_dev, msg);
> +	KUNIT_EXPECT_EQ(test, ret, 4);
> +	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
> +	KUNIT_EXPECT_EQ(test, msg->command, 0x1234);
> +	KUNIT_EXPECT_EQ(test, msg->outsize, 2);
> +	KUNIT_EXPECT_EQ(test, msg->version, 1);

If it wants to check the header is immutable, it should also check `insize`.
