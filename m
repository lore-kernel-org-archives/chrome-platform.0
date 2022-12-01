Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56465EC4
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 05:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A01C433C1;
	Thu,  1 Dec 2022 05:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669872554;
	bh=UGTTX6EbiF3imOIvt/wZI0la1ZjrYcsdnLZcv2BdGJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGJtzyrVA8NfQ+ZrJO+sy8WNEjs5A9Cpcmy846tS6CaZoK14qE7/phmfymtmO9rgl
	 aGHcMwQifeSAr0KpnkZrPkN5JiMm/ri2w7uUFgjNMTbKYVnTpAbuVBO+MN4+/qUAcS
	 fsT66UYiB8/KvBF7sDt4Wt6JDFjawzYXSblSI1dtGh3z5TUrROF5Q35BQLmdY4Q9QB
	 bgljJyu/6hu3kt+Lbawz3sLYikhD+yLmlUZyIFXVFN6SwM3lr8d/3YLZIaGUV5K4kS
	 PXurEzVfH+Z7AmG3Ub7ldnH9cYuyZ/1e5hYqtxAsynsLbfJD3PnRJGs5e+LRxe+z1Z
	 lPhz+UU3ZoBPQ==
Date: Thu, 1 Dec 2022 13:29:11 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v8 1/3] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
Message-ID: <Y4g7p3pz/yM5PtFp@google.com>
References: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130131245.v8.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>

On Wed, Nov 30, 2022 at 01:12:54PM -0700, Mark Hasemeyer wrote:
> This patch does following:
> 1. Adds a new cros-ec-uart driver. This driver can send EC requests on
>    UART and process response packets received on UART transport.
[...]
> 
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Overall the series looks good to me.  I would defer it for a while for
people in the mailing list to review and queue it for next next merge
window (i.e. for 6.3).

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2585e7edc3358..8ed08316fd11e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4918,6 +4918,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
>  F:	sound/soc/codecs/cros_ec_codec.*
>  
> +CHROMEOS EC UART DRIVER
> +M:	Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> +R:	Benson Leung <bleung@google.com>

Looking around the MAINTAINERS file, I am not sure if Benson would
prefer to use chromium.org account.
